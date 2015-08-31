//
//  HSFMore_AboutVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/29.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFMore_AboutVC.h"
#import "HSFMore_About_View.h"

@interface HSFMore_AboutVC ()

@end

@implementation HSFMore_AboutVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.estimatedSectionHeaderHeight = 100;
    self.tableView.tableHeaderView = [HSFMore_About_View moreAboutView];
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
