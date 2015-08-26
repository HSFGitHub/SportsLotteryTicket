//
//  HSFSporArenaViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/24.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFSporArenaViewController.h"

@interface HSFSporArenaViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl* SegmentCN;

@end

@implementation HSFSporArenaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.设置背景
    self.view.layer.contents = (__bridge id)([UIImage imageNamed:@"NLArenaBackground"].CGImage);

    //2.设置SegmentedControl(只能通过代码这种方式来设置)
    [self.SegmentCN setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.SegmentCN setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    // 3> 设置文字颜色
    NSDictionary* attrs = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
    [self.SegmentCN setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [self.SegmentCN setTitleTextAttributes:attrs forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
