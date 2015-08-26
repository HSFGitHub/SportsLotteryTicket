//
//  HSFDreamWheelView.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/26.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFDreamWheelView.h"
#import "HSFLuckWhellBtn.h"
#define kCount 12
@interface HSFDreamWheelView () <UIAlertViewDelegate>
@property (nonatomic, strong) NSArray* btnS;
@property (weak, nonatomic) IBOutlet UIImageView* rotateWheel;
@property (nonatomic, weak) HSFLuckWhellBtn* preBtn;
@property (nonatomic, weak) CADisplayLink* display;
@property (weak, nonatomic) IBOutlet UIButton* beginSelectNum;

@end
@implementation HSFDreamWheelView

#pragma mark - 快速创建view方法
/**
 *  快速创建view
 */
+ (instancetype)dreamWheelView
{
    return [[NSBundle mainBundle] loadNibNamed:@"DreamWheelView" owner:nil options:nil][0];
}

#pragma mark - 按钮触发方法类
- (void)startAnimation
{
    CADisplayLink* display = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginRunAction)];
    [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.display = display;
}

/**
 *  每次旋转一定的角度
 */
- (void)beginRunAction
{

    CGFloat angle = M_PI_4 * 0.005;
    self.rotateWheel.transform = CGAffineTransformRotate(self.rotateWheel.transform, angle);
}
/**
 *  监听12按钮事件
 */
- (void)didClickAction:(HSFLuckWhellBtn*)btn
{
    self.preBtn.selected = NO;
    btn.selected = YES;
    self.preBtn = btn;
}

/**
 *  点击开始选号按钮时，旋转8圈。继续旋转。
 *
 *  @param sender xib中的开始按钮
 */
- (IBAction)selectedNumAction:(id)sender
{
    if (self.preBtn.selected == YES) {

        //让圆盘旋转失效
        [self.display invalidate];
        self.display = nil;

        //1.开启选择动画
        CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        CGFloat angle = M_PI * 2 / 12 * (int)(self.preBtn.tag);
        CGFloat endAngle = M_PI * 2 * 10 - angle;
        //旋转6圈
        animation.toValue = @(endAngle);
        //持续时间
        animation.duration = 3;
        //设置核心速率
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        //添加隐式动画
        animation.delegate = self;
        //将图片添加到核心动画
        [self.rotateWheel.layer addAnimation:animation forKey:nil];
    }
}

#pragma mark - animation隐式协议方法
- (void)animationDidStart:(CAAnimation*)anim
{
    //动画开始时，不允许用户交互
    self.rotateWheel.userInteractionEnabled = NO;
    self.beginSelectNum.userInteractionEnabled = NO;
}
- (void)animationDidStop:(CAAnimation*)anim finished:(BOOL)flag
{

    //让选中按钮指向12点方向
    CGFloat angle = M_PI * 2 / 12 * (int)(self.preBtn.tag);
    CGFloat endAngle = M_PI * 2 - angle;
    self.rotateWheel.transform = CGAffineTransformMakeRotation(endAngle);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        UIAlertView* aler = [[UIAlertView alloc] initWithTitle:@"幸运选号" message:@"1234567" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];

        [aler show];
    });
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.rotateWheel.userInteractionEnabled = YES;
        self.beginSelectNum.userInteractionEnabled = YES;
        [self startAnimation];
    }
}
#pragma mark - layout(布局方法)
- (void)layoutSubviews
{

    [super layoutSubviews];

    //布局按钮
    [self layoutButtonS];
}
/**
 *  布局按钮
 */
- (void)layoutButtonS
{

    for (NSInteger i = 0; i < self.btnS.count; i++) {
        HSFLuckWhellBtn* btn = self.btnS[i];
        btn.frame = CGRectMake(0, 0, 68, 143);
        btn.center = self.rotateWheel.center;
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        CGFloat angle = M_PI * 2 / 12;
        btn.transform = CGAffineTransformRotate(btn.transform, angle * i);
    }
}

/**
 *  裁剪相应的图片
 *
 *  @param img 需要裁剪图片的名字
 *  @param i   第几个图片
 *
 *  @return 裁剪好的图片
 */
- (UIImage*)imagedWithImageName:(NSString*)img with:(NSInteger)i
{

    UIImage* image = [UIImage imageNamed:img];

    //缩放因子
    CGFloat scale = [UIScreen mainScreen].scale;

    CGFloat h = image.size.height;
    CGFloat w = image.size.width / 12;
    CGFloat y = 0;
    CGFloat x = i * w;

    h *= scale;
    w *= scale;
    x *= scale;
    y *= 0;

    //要在外边进行设置值。
    CGRect rect = CGRectMake(x, y, w, h);
    CGImageRef imgRef = CGImageCreateWithImageInRect(image.CGImage, rect);

    //转化好的图片
    UIImage* imaged = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);

    return imaged;
}
#pragma mark - 懒加载方法
/**
 *  懒加载
 */
- (NSArray*)btnS
{
    if (nil == _btnS) {

        NSMutableArray* tempArray = [NSMutableArray arrayWithCapacity:kCount];
        for (NSInteger i = 0; i < kCount; i++) {
            HSFLuckWhellBtn* btn = [[HSFLuckWhellBtn alloc] init];
            btn.tag = i;
            [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(didClickAction:) forControlEvents:UIControlEventTouchDown];
            [btn setImage:[self imagedWithImageName:@"LuckyAstrology" with:i] forState:UIControlStateNormal];
            [btn setImage:[self imagedWithImageName:@"LuckyAstrologyPressed" with:i] forState:UIControlStateSelected];
            [self.rotateWheel addSubview:btn];

            if (0 == i) {
                btn.selected = YES;
                self.preBtn = btn;
            }
            [tempArray addObject:btn];
        }
        _btnS = tempArray;
    }
    return _btnS;
}

@end
