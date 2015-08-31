//
//  HSFCollectionViewCell.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSFCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImage *image;
// 根据传递过来的总的单元格的个数, 以及当前滚动到了第几个单元格, 来决定"立即体验"按钮是否应该显示
- (void)setStartButtonVisibleWithIndex:(int)idx count:(int)count;
@end
