//
//  HSFMoreProductVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/30.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFMoreProductVC.h"
#import "HSFProductCollectionCell.h"
#import "HSFProductModel.h"

@interface HSFMoreProductVC ()
@property (nonatomic, strong) NSArray* products;

@end

@implementation HSFMoreProductVC

//重写init方法
- (instancetype)init
{

    //创建一个布局参数对象
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];

    //设置每个格子的大小
    flowLayout.itemSize = CGSizeMake(100, 110);

    //设置组间距
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);

    //设置水平间距
    flowLayout.minimumInteritemSpacing = 10;

    //设置行间距
    flowLayout.minimumLineSpacing = 10;

    return [self initWithCollectionViewLayout:flowLayout];
}

static NSString* const reuseIdentifier = @"Product_Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib* xib = [UINib nibWithNibName:@"HSFProductCollectionCell" bundle:nil];
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:reuseIdentifier];

    self.collectionView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg"]];
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{

    HSFProductCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //设置数据
    cell.model = self.products[indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{

    HSFProductModel* model = self.products[indexPath.row];

    NSString* urlStr = [NSString stringWithFormat:@"%@://%@", model.customUrl, model.ID];

    //app在本地url
    NSURL* appUrl = [NSURL URLWithString:urlStr];
    //app在苹果商店url
    NSURL* appUrlInStore = [NSURL URLWithString:[NSString stringWithFormat:@"%@", model.url]];

    UIApplication* application = [UIApplication sharedApplication];

    //本地有app则打开，没有则连接到苹果商店里
    if ([application openURL:appUrl]) {
        [application openURL:appUrl];
    }
    else {
        [application openURL:appUrlInStore];
    }
}
#pragma mark - 重写getter方法
- (NSArray*)products
{
    if (_products == nil) {

        //1.获取json文件路径
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"];

        //2.加载json文件
        NSData* data = [NSData dataWithContentsOfFile:filePath];

        //3.把将json数据，加载到数组中
        NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        //4.把字典数组转换
        NSMutableArray* temp = [NSMutableArray arrayWithCapacity:jsonArray.count];
        for (NSDictionary* dic in jsonArray) {
            HSFProductModel* model = [HSFProductModel productWithDict:dic];

            [temp addObject:model];
        }

        _products = temp;
    }
    return _products;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
