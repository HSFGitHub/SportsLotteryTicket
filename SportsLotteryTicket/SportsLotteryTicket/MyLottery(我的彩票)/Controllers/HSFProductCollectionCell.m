//
//  HSFProductCollectionCell.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/30.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFProductCollectionCell.h"
#import "HSFProductModel.h"
@interface HSFProductCollectionCell ()
/**
 *  图片logo
 */
@property (weak, nonatomic) IBOutlet UIImageView* imageView;
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel* textLabel;

@end

@implementation HSFProductCollectionCell

- (void)awakeFromNib
{
    //裁剪图片
    self.imageView.layer.cornerRadius = 15;
    self.imageView.layer.masksToBounds = YES;
    self.layer.contents = (__bridge id)([UIImage imageNamed:@"icon_back"].CGImage);
}

//重写setter方法
- (void)setModel:(HSFProductModel*)model
{
    _model = model;

    //设置数据
    _imageView.image = [UIImage imageNamed:model.icon];
    _textLabel.text = model.title;
}

@end
