//
//  HSFPushAndRemindVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/28.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFPushAndRemindVC.h"
#import "UIView+HSFView.h"
#import "HSFSettingCell.h"

@interface HSFPushAndRemindVC ()
/**
 *  时间TextField
 */
@property (nonatomic, strong) UITextField* timeField;
/**
 *  纪录选择时间
 */
@property (nonatomic, weak) UIDatePicker* dataPicker;

@end

@implementation HSFPushAndRemindVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];

    if (indexPath.section == 1 && indexPath.row == 0) {

        [cell.contentView addSubview:_timeField];

        [self.timeField becomeFirstResponder];
    }
    else if (indexPath.section == 2 && indexPath.row == 0) {
        [cell.contentView addSubview:_timeField];

        [self.timeField becomeFirstResponder];
    }
}

#pragma mark - 加载数据
/**
 *  重写getter方法,加载数据
 */
- (UITextField*)timeField
{

    if (_timeField == nil) {

        _timeField = [[UITextField alloc] init];
        //添加DatePicker
        UIDatePicker* date = [[UIDatePicker alloc] init];
        date.datePickerMode = UIDatePickerModeTime;
        date.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _timeField.inputView = date;
        self.dataPicker = date;

        //添加UIToolbar
        UIToolbar* toolbar = [[UIToolbar alloc] init];
        //        toolbar.backgroundColor = [UIColor whiteColor];
        toolbar.h = 44;
        UIBarButtonItem* cancle = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleAction)];

        UIBarButtonItem* flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
        toolbar.items = @[ cancle, flexible, save ];
        _timeField.inputAccessoryView = toolbar;
    }
    return _timeField;
}

#pragma mark - UIBarButtonItem方法
- (void)cancleAction
{
    [self.view endEditing:YES];
}

- (void)saveAction
{
    //选择cell
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    HSFSettingCell* cell = (HSFSettingCell*)[self.tableView cellForRowAtIndexPath:indexPath];

    //格式Date
    NSDate* date = self.dataPicker.date;
    NSDateFormatter* dateFmt = [[NSDateFormatter alloc] init];
    dateFmt.dateFormat = @"HH:mm";

    NSString* timeStr = [dateFmt stringFromDate:date];
    [cell setDetailTextLabel:timeStr];
    [self.view endEditing:YES];
}

@end
