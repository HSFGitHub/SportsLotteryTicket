//
//  HSFSorArenaViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/24.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFSorArenaNavgationController.h"

@interface HSFSorArenaNavgationController ()

@end

@implementation HSFSorArenaNavgationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
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
