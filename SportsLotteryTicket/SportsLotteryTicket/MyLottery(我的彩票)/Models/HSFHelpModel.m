//
//  HSFHelpModel.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFHelpModel.h"

@implementation HSFHelpModel
/**
 *  模型对象方法
 */
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        
        self.title = dic[@"title"];
        self.html = dic[@"html"];
        self.ID = dic[@"id"];
    }
    return self;
}

/**
 *  模型类方法
 */
+(instancetype)helpModelWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}

/**
 *  快速遍历字典转模型
 */
+(NSMutableArray *)helpModels{
    //1.绑定文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"help" ofType:@"json"];

    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *fileArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //临时数组（方便遍历）
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:fileArray.count];
    //遍历数组
    for (NSDictionary *dic in fileArray) {
        
        HSFHelpModel *model = [HSFHelpModel helpModelWithDictionary:dic];
        
        [tempArray addObject:model];
    }
    return tempArray;
}
@end
