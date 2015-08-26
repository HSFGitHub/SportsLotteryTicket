//
//  HSFNavgationController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/24.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFNavgationController.h"

@interface HSFNavgationController ()

@end

@implementation HSFNavgationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//重写push方法
- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    //push的时候，隐藏bottomBar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
