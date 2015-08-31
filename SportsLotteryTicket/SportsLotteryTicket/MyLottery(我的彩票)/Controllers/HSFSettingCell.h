//
//  HSFSettingCell.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/27.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSFSettingCell : UITableViewCell
/**
 *  设置cell的数据 
 */
@property (nonatomic, strong) NSDictionary* item;

//快速创建的cell
+ (instancetype)settingWithtableView:(UITableView*)tableView andDic:(NSDictionary*)dic;
//设置detailTextLabel文字
- (void)setDetailTextLabel:(NSString*)timeStr;
@end
