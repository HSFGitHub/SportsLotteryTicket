//
//  HSFHelpCell.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFHelpCell.h"
#import "HSFHelpModel.h"

@implementation HSFHelpCell

- (void)setHelpModel:(HSFHelpModel*)helpModel
{
    _helpModel = helpModel;

    self.textLabel.text = helpModel.title;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
