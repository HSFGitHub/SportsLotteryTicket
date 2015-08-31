//
//  HSFGuideCVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFGuideCVC.h"
#import "UIView+HSFView.h"
#import "HSFCollectionViewCell.h"
#define kGuideItemsCount 4
#define kGuideSectionCount 1
@interface HSFGuideCVC ()
/**
 *  Icon图片
 */
@property (nonatomic, weak) UIImageView* imageIcon;
/**
 *  大文字
 */
@property (nonatomic, weak) UIImageView* imageLargeText;
/**
 *  小文字
 */
@property (nonatomic, weak) UIImageView* imageSmallerText;

@end

@implementation HSFGuideCVC
//重写init方法
- (instancetype)init
{

    UICollectionViewFlowLayout* flow = [[UICollectionViewFlowLayout alloc] init];
    //item尺寸
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    //滚动方向
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    //间距设置为0
    //    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    //    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

    return [super initWithCollectionViewLayout:flow];
}

static NSString* const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Register cell classes
    [self.collectionView registerClass:[HSFCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor redColor];

    //关闭弹簧效果
    self.collectionView.bounces = NO;
    //关闭水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //开启分页
    self.collectionView.pagingEnabled = YES;

    // 1. 添加"足球"图片
    UIImageView* imgViewIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:imgViewIcon];
    self.imageIcon = imgViewIcon;

    // 2. 添加"波浪线"图片
    UIImageView* imgViewLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    imgViewLine.x = -202;
    [self.collectionView addSubview:imgViewLine];

    // 3. 添加大文字图片
    UIImageView* imgViewLarge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    imgViewLarge.y = self.collectionView.bounds.size.height * 0.7;
    [self.collectionView addSubview:imgViewLarge];
    self.imageLargeText = imgViewLarge;

    // 4. 添加小文字图片
    UIImageView* imgViewSmall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    imgViewSmall.y = self.collectionView.bounds.size.height * 0.8;
    [self.collectionView addSubview:imgViewSmall];
    self.imageSmallerText = imgViewSmall;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return kGuideSectionCount;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kGuideItemsCount;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    HSFCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    NSString* imageStr = [NSString stringWithFormat:@"guide%dBackground", (int)(indexPath.row + 1)];
    cell.image = [UIImage imageNamed:imageStr];

    [cell setStartButtonVisibleWithIndex:(int)indexPath.row count:kGuideItemsCount];

    return cell;
}

// 监听滚动结束事件
- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    // 获取当前滚动偏移的x值
    CGFloat offsetX = scrollView.contentOffset.x;

    // 修改图片框中的图片
    // 1> 获取图片名称
    // 计算滚动到了第几页?
    int page = offsetX / scrollView.bounds.size.width;
    NSString* imgIcon = [NSString stringWithFormat:@"guide%d", (page + 1)];
    NSString* imgLargeText = [NSString stringWithFormat:@"guideLargeText%d", (page + 1)];
    NSString* imgSmallText = [NSString stringWithFormat:@"guideSmallText%d", (page + 1)];

    // 2> 设置图片给图片框
    self.imageIcon.image = [UIImage imageNamed:imgIcon];
    self.imageLargeText.image = [UIImage imageNamed:imgLargeText];
    self.imageSmallerText.image = [UIImage imageNamed:imgSmallText];

    // -------------- 判断滚动方向, 决定动画该如何执行 ------------------]
    CGFloat startX;
    //如果是从右向左滚动，那么就让图片框的x等于offsetX + 一个宽度（只要是从右向左滚动，那么刚刚滚动完毕后肯定是offsetX > 图片框原来的x）
    if (offsetX > self.imageIcon.x) { // 从右向左滚动
        startX = offsetX + scrollView.bounds.size.width;
    }
    else {
        //如果是从左向右滚动，那么就让图片狂的x等于offsetX – 一个宽度（只要是从左向右滚动，那么滚动完毕后肯定是offsetX < 图片框的x）
        startX = offsetX - scrollView.bounds.size.width;
    }
    self.imageIcon.x = startX;
    self.imageLargeText.x = startX;
    self.imageSmallerText.x = startX;

    // -------------- 判断滚动方向, 决定动画该如何执行 ------------------

    // 设置图片的x值
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.imageIcon.x = offsetX;
                         self.imageLargeText.x = offsetX;
                         self.imageSmallerText.x = offsetX;
                     }];
}

@end
