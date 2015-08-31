//
//  HSFProductModel.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/30.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFProductModel.h"

@implementation HSFProductModel
- (instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.url = dict[@"url"];
        self.ID = dict[@"id"];
        self.customUrl = dict[@"customUrl"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary*)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
