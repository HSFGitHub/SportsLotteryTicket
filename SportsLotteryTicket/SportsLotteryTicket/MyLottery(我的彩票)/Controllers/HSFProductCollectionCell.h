//
//  HSFProductCollectionCell.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/30.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSFProductModel;
@interface HSFProductCollectionCell : UICollectionViewCell

/**
 *  数据模型
 */
@property(nonatomic,strong)HSFProductModel *model;

@end
