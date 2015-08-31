//
//  HSFHelpModel.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSFHelpModel : NSObject
/**
 *  标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  静态网页
 */
@property(nonatomic,copy)NSString *html;

/**
 *  id距离
 */
@property(nonatomic,copy)NSString *ID;

/**
 *  模型对象方法
 */
-(instancetype)initWithDictionary:(NSDictionary *)dic;

/**
 *  模型类方法
 */
+(instancetype)helpModelWithDictionary:(NSDictionary *)dic;

/**
 *  快速遍历字典转模型
 */
+(NSMutableArray *)helpModels;


@end
