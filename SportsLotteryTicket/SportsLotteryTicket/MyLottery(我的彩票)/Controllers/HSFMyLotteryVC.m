//
//  HSFMyLotteryVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/27.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFMyLotteryVC.h"
#import "HSFSettingVC.h"
#import "HSFQuestionVC.h"

@interface HSFMyLotteryVC ()
@property (weak, nonatomic) IBOutlet UIButton* loginBtn;

@end

@implementation HSFMyLotteryVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.loginBtn setBackgroundImage:[self imagedWithImageName:@"RedButton"] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[self imagedWithImageName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

/**
 *  将图片进行拉伸操作
 *
 *  @param name 图片名字
 *
 *  @return 拉伸后的图片
 */
- (UIImage*)imagedWithImageName:(NSString*)name
{

    UIImage* image = [UIImage imageNamed:name];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return image;
}

/**
 *  点击进入设置界面
 */
- (IBAction)settingAction:(id)sender
{
    //创建HSFSettingVC
    HSFSettingVC* setting = [[HSFSettingVC alloc] init];
    setting.title = @"设置";
    setting.plistName = @"Settings";
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(questionVCPush)];

    setting.navigationItem.rightBarButtonItem = rightBtn;
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)questionVCPush
{
    HSFQuestionVC* question = [[HSFQuestionVC alloc] init];
    [self.navigationController pushViewController:question animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
