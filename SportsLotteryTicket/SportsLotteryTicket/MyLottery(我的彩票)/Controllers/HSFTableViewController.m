//
//  HSFTableViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/27.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFTableViewController.h"

@interface HSFTableViewController ()

@end

@implementation HSFTableViewController


-(instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
 self =  [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
