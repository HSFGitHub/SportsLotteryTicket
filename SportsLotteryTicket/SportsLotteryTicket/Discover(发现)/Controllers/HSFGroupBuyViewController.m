//
//  HSFGroupBuyViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/25.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFGroupBuyViewController.h"
#import "UIView+HSFView.h"

@interface HSFGroupBuyViewController ()
@property (nonatomic, strong) UIView* topView;

@end

@implementation HSFGroupBuyViewController

- (UIView*)topView
{
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor yellowColor];
        _topView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 0);
        [self.view addSubview:_topView];
    }
    return _topView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)downArrowAction:(UIButton*)sender
{

    //先创建一下，防止和动画不协调
    [self topView];

    //1.选择按钮图片
    [UIView animateWithDuration:0.3
                     animations:^{
                         sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
                         //2.弹出隐藏按钮
                         if (0 == self.topView.frame.size.height) {
                             self.topView.h = 200;
                         }
                         else {
                             self.topView.h = 0;
                         }
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
