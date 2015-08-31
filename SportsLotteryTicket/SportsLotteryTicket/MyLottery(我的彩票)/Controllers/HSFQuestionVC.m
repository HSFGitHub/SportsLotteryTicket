//
//  HSFQuestionVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFQuestionVC.h"
#import "HSFHelpModel.h"
#import "HSFHelpCell.h"
#import "HSFHelpWebVC.h"
#import "HSFNavgationController.h"

@interface HSFQuestionVC ()
@property (nonatomic, strong) NSArray* questions;

@end

@implementation HSFQuestionVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.questions.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{

    HSFHelpModel* helpModel = self.questions[indexPath.row];
    NSString* cellID = @"helpCell";
    HSFHelpCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
        cell = [[HSFHelpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.helpModel = helpModel;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //执行语句
    HSFHelpModel* model = self.questions[indexPath.row];

    HSFHelpWebVC* webVC = [[HSFHelpWebVC alloc] init];
    webVC.helpModel = model;

    HSFNavgationController* nav = [[HSFNavgationController alloc] initWithRootViewController:webVC];

    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 加载数据
- (NSArray*)questions
{
    if (_questions == nil) {

        _questions = [HSFHelpModel helpModels];
    }
    return _questions;
}
@end
