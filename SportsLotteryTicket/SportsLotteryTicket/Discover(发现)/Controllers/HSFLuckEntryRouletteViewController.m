//
//  HSFLuckEntryRouletteViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/26.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFLuckEntryRouletteViewController.h"
#import "HSFDreamWheelView.h"

@interface HSFLuckEntryRouletteViewController ()

@end

@implementation HSFLuckEntryRouletteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //设置背景
    self.view.layer.contents = (__bridge id)([UIImage imageNamed:@"LuckyBackground.jpg"].CGImage);

    //关闭nav
    [UIView animateWithDuration:0.5
                     animations:^{

                         self.navigationController.navigationBarHidden = YES;

                     }];

    //创建幸运转盘
    HSFDreamWheelView* dreamWheel = [HSFDreamWheelView dreamWheelView];
    dreamWheel.center = self.view.center;
    [dreamWheel startAnimation];
    [self.view addSubview:dreamWheel];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{

    UITouch* touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];

    if (CGRectContainsPoint(CGRectMake(0, 0, self.view.bounds.size.width, 100), point)) {

        self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
    }

    //    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
