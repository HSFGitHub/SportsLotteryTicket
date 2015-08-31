//
//  HSFSettingVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/27.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFSettingVC.h"
#import "HSFSettingCell.h"

@interface HSFSettingVC ()
@property (nonatomic, strong) NSArray* groups;

@end

@implementation HSFSettingVC

#pragma mark - ViewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //设置主题颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //重置返回按钮
    UIBarButtonItem* barBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickAction)];
    self.navigationItem.leftBarButtonItem = barBtn;
}

#pragma mark - tableViewDataSource
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return self.groups.count;
}
//设置每组行数
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self arrayWithRowInSection:section].count;
}
//设置cell数据
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSDictionary* item = [self itemWithRowIndexPath:indexPath];

    //创建cell
    HSFSettingCell* cell = [HSFSettingCell settingWithtableView:tableView andDic:item];
    cell.item = item;

    return cell;
}
//设置header标题
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.groups[section] objectForKey:@"header"];
}
//设置footer标题
- (NSString*)tableView:(UITableView*)tableView titleForFooterInSection:(NSInteger)section
{

    return [self.groups[section] objectForKey:@"footer"];
}
#pragma mark - tableViewDelegate
//选中row处理事件
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //取出数据
    NSDictionary* item = [self itemWithRowIndexPath:indexPath];
    NSString* targeVCString = item[@"targeVC"];

    //提取class类型
    Class targeVClass = NSClassFromString(targeVCString);
    id targeVC = [[targeVClass alloc] init];

    //跳转
    if (targeVCString.length > 0) {
        [targeVC setTitle:item[@"title"]];
        if (item[@"targeVCPlist"]) {
            [targeVC setPlistName:item[@"targeVCPlist"]];
        }
        [self.navigationController pushViewController:targeVC animated:YES];
    }

    if (item[@"function"]) {
        SEL function = NSSelectorFromString(item[@"function"]);
        if ([self respondsToSelector:function]) {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:function];
#pragma clang diagnostic pop
        }
    }
}

#pragma mark - 方法
//检查最新版本
- (void)checkUpData
{

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"版本检测" message:@"已是最新版本" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//返回
- (void)didClickAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - （加载数据）
- (NSArray*)groups
{
    if (_groups == nil) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        _groups = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _groups;
}

//row加在数据
- (NSDictionary*)itemWithRowIndexPath:(NSIndexPath*)indexPath
{
    NSDictionary* dic = self.groups[indexPath.section];
    NSArray* array = dic[@"item"];
    NSDictionary* item = array[indexPath.row];
    return item;
}
//section加在数据
- (NSArray*)arrayWithRowInSection:(NSInteger)section
{

    NSDictionary* dic = self.groups[section];
    NSArray* array = dic[@"item"];

    return array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
