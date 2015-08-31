//
//  HSFProductModel.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/30.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSFProductModel : NSObject
/*
 "title": "邮箱大师",
 "stitle":"网易推出的通用邮箱APP",
 "id": "com.netease.mailmaster",
 "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
 "icon": "mail",
 "customUrl": "mailmaster"
 
 例子:"customUrl + :// + id"可以定位到应用
 */
/**
*   app标题
*/
@property (nonatomic, copy) NSString* title;
/**
 *  app子标题
 */
@property (nonatomic, copy) NSString* stitle;
/**
 *  app唯一标识符
 */
@property (nonatomic, copy) NSString* ID;
/**
 *  app在苹果商店路径
 */
@property (nonatomic, copy) NSString* url;
/**
 *  app的icon
 */
@property (nonatomic, copy) NSString* icon;
/**
 *  app协议名
 */
@property (nonatomic, copy) NSString* customUrl;

//对象方法初始化数据模型
- (instancetype)initWithDict:(NSDictionary*)dict;
//类方法初始化数据模型
+ (instancetype)productWithDict:(NSDictionary*)dict;
@end
