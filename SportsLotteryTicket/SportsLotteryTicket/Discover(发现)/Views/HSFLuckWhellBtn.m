//
//  HSFLuckWhellBtn.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/26.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFLuckWhellBtn.h"

@implementation HSFLuckWhellBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{

    return CGRectMake((contentRect.size.width - 40) * 0.5, 30, 40, 40);
}

//高亮不渲染
- (void)setHighlighted:(BOOL)highlighted
{
}
@end
