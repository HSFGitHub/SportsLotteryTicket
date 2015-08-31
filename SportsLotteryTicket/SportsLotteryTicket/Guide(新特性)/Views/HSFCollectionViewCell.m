//
//  HSFCollectionViewCell.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFCollectionViewCell.h"
#import "HSFTabBarViewController.h"
@interface HSFCollectionViewCell ()
@property (nonatomic, strong) UIImageView* imgViewBg;
// 创建一个立即体验按钮
@property (nonatomic, strong) UIButton* startButton;
@end
@implementation HSFCollectionViewCell

- (void)setStartButtonVisibleWithIndex:(int)idx count:(int)count
{
    if (idx == count - 1) {
        self.startButton.hidden = NO;
    }
    else {
        self.startButton.hidden = YES;
    }
}
- (UIButton*)startButton
{
    if (_startButton == nil) {
        _startButton = [[UIButton alloc] init];
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        // 为立即体验按钮注册一个单击事件
        [_startButton addTarget:self action:@selector(didClickStartButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_startButton];
    }
    return _startButton;
}

- (void)didClickStartButton
{
    HSFTabBarViewController* mainVc = [[HSFTabBarViewController alloc] init];
    self.window.rootViewController = mainVc;
}

//加载数据
- (UIImageView*)imgViewBg
{
    if (_imgViewBg == nil) {
        _imgViewBg = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgViewBg];
    }
    return _imgViewBg;
}

//重写setter方法设置背景
- (void)setImage:(UIImage*)image
{
    _image = image;
    self.imgViewBg.image = image;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imgViewBg.frame = self.bounds;

    CGFloat w = 161;
    CGFloat h = 40;
    CGFloat x = (self.bounds.size.width - w) * 0.5;
    CGFloat y = self.bounds.size.height * 0.9;
    self.startButton.frame = CGRectMake(x, y, w, h);
}

@end
