//
//  AppDelegate.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/24.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "AppDelegate.h"
#import "HSFTabBarViewController.h"
#import "HSFGuideCVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{

    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [self chooseStartController];
    //设置状态栏样式
    [self setupStatusStyleWithApplication:application];
    //设置nav样式
    [self setupNavigationStryle];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 方法
//设置状态栏样式
- (void)setupStatusStyleWithApplication:(UIApplication*)application
{
    //显示状态
    application.statusBarHidden = NO;
    //设置样式
    application.statusBarStyle = UIStatusBarStyleLightContent;
}

//设置nav样式
- (void)setupNavigationStryle
{ //通过appearance来获得
    UINavigationBar* nav = [UINavigationBar appearance];
    [nav setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary* titleDic = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
    [nav setTitleTextAttributes:titleDic];
}

// 用来选择启动控制器
- (void)chooseStartController
{

    // 1.1 获取当前app的版本号
    NSString* appVer = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];

    // 1.2 读取偏好设置中记录的app的版本号, 和当前的app的版本进行比较
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    // 获取上一次记录的版本号
    NSString* lastVer = [userDefault objectForKey:@"app_version"];
    // 1.2.2 如果两次版本号一致, 表示不是第一次启动   ------> 显示主控制器
    if ([appVer isEqualToString:lastVer]) {

        // 2. 创建UITabBarController
        HSFTabBarViewController* mainVc = [[HSFTabBarViewController alloc] init];
        // 3. 设置mainVc为self.window的根控制器
        self.window.rootViewController = mainVc;
    }
    else {
        // 1.2.1 如果两次版本号不一致, 表示是第一次启动（或者说是更新后的第一次启动）----> 显示新特性界面
        // 创建新特性界面控制器
        HSFGuideCVC* guide = [[HSFGuideCVC alloc] init];
        self.window.rootViewController = guide;
    }

    // 1.3 把当前app的版本号重新写入到"偏好设置"中
    [userDefault setObject:appVer forKey:@"app_version"];

    // 同步一下
    [userDefault synchronize];
}

@end
