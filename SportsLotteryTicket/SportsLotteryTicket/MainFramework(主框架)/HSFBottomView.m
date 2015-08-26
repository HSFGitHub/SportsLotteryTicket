//
//  HSFBottomView.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/25.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFBottomView.h"
#import "HSFBottomButton.h"
@interface HSFBottomView ()
@property (nonatomic, weak) HSFBottomButton* selected;
@end
@implementation HSFBottomView

#pragma mark - aboutBottonSometing（按钮的相关方法）
/**
 *  根据按钮的个数来添加
 *
 *  @param count 按钮个数
 */
- (void)addbuttomByCount:(NSUInteger)count
{
    for (NSInteger i = 0; i < count; i++) {
        //依次创建按哪
        HSFBottomButton* btn = [[HSFBottomButton alloc] init];
        btn.tag = i;
        NSString* btnNorName = [NSString stringWithFormat:@"TabBar%ld", i + 1];
        NSString* btnSelName = [NSString stringWithFormat:@"TabBar%ldSel", i + 1];
        [btn setBackgroundImage:[UIImage imageNamed:btnNorName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:btnSelName] forState:UIControlStateSelected];

        [btn addTarget:self action:@selector(didClickAction:) forControlEvents:UIControlEventTouchDown];

        [self addSubview:btn];
    }
}

/**
 *  监听底部按钮触发事件
 *
 *  @param btn 需要监听的代码
 */
- (void)didClickAction:(HSFBottomButton*)btn
{
    //拿到最后一个按钮(每次让上一个选中状态变成NO)
    self.selected.selected = NO;
    btn.selected = YES;
    self.selected = btn;

    //执行代理，让主控制器切换视图
    if ([self.delegate respondsToSelector:@selector(bottomView:WithIndex:)]) {

        [self.delegate bottomView:self WithIndex:btn.tag];
    }
}

#pragma mark -layout(布局相关方法)
- (void)layoutSubviews
{
    [super layoutSubviews];

    //布局按钮
    [self layoutBtn];
}

/**
 *  布局底部的按钮
 */
- (void)layoutBtn
{
    //设置按钮位置
    NSUInteger count = self.subviews.count;
    CGFloat w = self.frame.size.width / count;
    CGFloat h = self.frame.size.height;
    CGFloat y = 0;

    for (NSInteger i; i < count; i++) {
        HSFBottomButton* btn = self.subviews[i];
        CGFloat x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        if (0 == i) {
            [self didClickAction:btn];
        }
    }
}

@end
