//
//  HSFDownArrow.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/26.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFDownArrow.h"
#import "UIView+HSFView.h"

@implementation HSFDownArrow

- (void)layoutSubviews
{

    [super layoutSubviews];

    //设置标题在左边
    self.titleLabel.x = 0;

    //图片在右边
    self.imageView.x = self.bounds.size.width - self.imageView.frame.size.width;
}

@end
