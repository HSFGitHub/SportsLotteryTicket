//
//  HSFTabBarViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/24.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFTabBarViewController.h"
#import "HSFHallNavigationController.h"
#import "HSFBottomView.h"

@interface HSFTabBarViewController () <HSFBottomViewDelegate>
@property (nonatomic, weak) HSFBottomView* bottomView;

@end

@implementation HSFTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //1.添加Storyboary到TabBar中
    [self setupStoryboary];

    //2.添加Bottom按钮
    [self addBottomButtom];

    //    self.bottomView.delegate = self;
}

#pragma mark - Action

//添加Storyboary
- (void)setupStoryboary
{

    //依次创建Nav
    HSFNavgationController* hall = [self navigationWithStoryName:@"Hall"];
    HSFNavgationController* sporArena = [self navigationWithStoryName:@"SporArena"];
    HSFNavgationController* discover = [self navigationWithStoryName:@"Discover"];
    HSFNavgationController* lotteryInformation = [self navigationWithStoryName:@"LotteryInformation"];
    HSFNavgationController* myLottery = [self navigationWithStoryName:@"MyLottery"];

    //添加
    self.viewControllers = @[ hall, sporArena, discover, lotteryInformation, myLottery ];
}

/**
 *  根据storyName来创建Navigation控制器
 *
 *  @param storyName 穿一个storyName名字
 *
 *  @return 创建好的HSFNavgationController;
 */
- (HSFNavgationController*)navigationWithStoryName:(NSString*)storyName
{

    UIStoryboard* hall = [UIStoryboard storyboardWithName:storyName bundle:nil];
    HSFNavgationController* Nav = [hall instantiateInitialViewController];

    return Nav;
}

/**
 * 添加底部按钮
 */
- (void)addBottomButtom
{

    //创建底部视图，添加按钮
    HSFBottomView* bottomView = [[HSFBottomView alloc] init];
    bottomView.frame = self.tabBar.bounds;
    [bottomView addbuttomByCount:5];

    [self.tabBar addSubview:bottomView];
    self.bottomView = bottomView;
    //添加代理
    bottomView.delegate = self;
}

#pragma mark - HSFBottomViewDelegate（代理）
/**
 *  通过idx来切换控制器
 *
 *  @param idx 用来切换的标签
 */
- (void)bottomView:(HSFBottomView*)bottomView WithIndex:(NSInteger)idx
{
    self.selectedIndex = idx;
}
#pragma mark - MemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
