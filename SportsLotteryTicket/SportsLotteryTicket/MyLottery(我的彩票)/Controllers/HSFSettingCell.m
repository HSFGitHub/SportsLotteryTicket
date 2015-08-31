//
//  HSFSettingCell.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/27.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFSettingCell.h"

@implementation HSFSettingCell

//快速建立Cell
+ (instancetype)settingWithtableView:(UITableView*)tableView andDic:(NSDictionary*)dic
{

    //cell的可重用ID根据，根据cell的样式确定
    NSString* cellID = dic[@"cellStyle"] == nil ? @"UITableViewCellStyleDefault" : dic[@"cellStyle"];

    HSFSettingCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[HSFSettingCell alloc] initWithStyle:[self cellStyleWithDic:dic] reuseIdentifier:cellID];
    }
    return cell;
}

/**
 *  设置相应的Cell样式
 *
 *  @return 设置好的样式
 */
+ (UITableViewCellStyle)cellStyleWithDic:(NSDictionary*)dic
{
    NSString* cellStyle = dic[@"cellStyle"];
    if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    }
    else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }
    else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    }
    else {
        return UITableViewCellStyleDefault;
    }
}
//设置数据
- (void)setItem:(NSDictionary*)item
{
    _item = item;

    //设置cell的数据
    if (item[@"title"]) {

        self.textLabel.text = item[@"title"];
    }

    if (item[@"icon"]) {

        self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    }
    else {
        self.imageView.image = nil;
    }

    //取出AccessoryView
    NSString* string = item[@"accessoryView"];
    Class accessoryView = NSClassFromString(string);
    id view = [[accessoryView alloc] init];

    if ([view isKindOfClass:[UIImageView class]]) {
        UIImageView* imageView = (UIImageView*)view;
        imageView.image = [UIImage imageNamed:item[@"accessoryViewIcon"]];

        //让图片合适大小的尺寸
        [imageView sizeToFit];
    }

    if ([view isKindOfClass:[UISwitch class]] && item[@"switchKey"]) {

        NSUserDefaults* switchBtn = [NSUserDefaults standardUserDefaults];
        BOOL isON = [switchBtn boolForKey:item[@"switchKey"]];
        [view setOn:isON];

        [view addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    }
    self.accessoryView = view;

    if (item[@"title_detail"]) {

        self.detailTextLabel.text = item[@"title_detail"];

        NSUserDefaults* timeSave = [NSUserDefaults standardUserDefaults];
        NSString* currentTime = [timeSave stringForKey:item[@"title_detail_currentTime"]];
        if (item[@"title_detail_currentTime"] && (currentTime.length > 0)) {

            self.detailTextLabel.text = currentTime;
        }
    }

    if ([item[@"title_detail_color"] isEqualToString:@"redColor"]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }
}

//设置detailTextLabel的具体时间
- (void)setDetailTextLabel:(NSString*)timeStr
{
    self.detailTextLabel.text = timeStr;

    //存储时间
    NSUserDefaults* timeSave = [NSUserDefaults standardUserDefaults];
    [timeSave setObject:timeStr forKey:self.item[@"title_detail_currentTime"]];
    [timeSave synchronize];
}

//监听switchBtn
- (void)changeValue:(UISwitch*)switchBtn
{
    //存储按钮状态
    NSUserDefaults* saveBtn = [NSUserDefaults standardUserDefaults];
    [saveBtn setObject:@(switchBtn.on) forKey:self.item[@"switchKey"]];
    [saveBtn synchronize];
}

@end
