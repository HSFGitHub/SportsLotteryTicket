//
//  HSFBottomView.h
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/25.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSFBottomView;
@protocol HSFBottomViewDelegate <NSObject>
/**
 *  通过idx来切换控制器
 *
 *  @param idx 用来切换的标签
 */
- (void)bottomView:(HSFBottomView *)bottomView  WithIndex:(NSInteger)idx;
@end

@interface HSFBottomView : UIView
@property (nonatomic, weak) id<HSFBottomViewDelegate> delegate;

/**
 *  根据按钮的个数来添加
 *
 *  @param count 按钮个数
 */
- (void)addbuttomByCount:(NSUInteger)count;
@end
