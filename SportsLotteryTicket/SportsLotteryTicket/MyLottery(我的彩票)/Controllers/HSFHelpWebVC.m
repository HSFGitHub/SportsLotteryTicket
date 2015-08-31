//
//  HSFHelpWebVC.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/31.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFHelpWebVC.h"
#import "HSFHelpModel.h"

@interface HSFHelpWebVC () <UIWebViewDelegate>

@end

@implementation HSFHelpWebVC

- (void)loadView
{
    //    [super loadView];

    //设置webView
    UIWebView* webView = [[UIWebView alloc] init];
    webView.frame = [UIScreen mainScreen].bounds;
    self.view = webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //关闭按钮
    UIBarButtonItem* leftBrn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(didClickAction)];
    self.navigationItem.leftBarButtonItem = leftBrn;

    //找到本地url
    NSURL* helpURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@", self.helpModel.html] withExtension:nil];

    //网络请求
    NSURLRequest* request = [NSURLRequest requestWithURL:helpURL];

    //创建WebView
    UIWebView* webView = (UIWebView*)self.view;

    webView.delegate = self;

    //请求网络
    [webView loadRequest:request];
}

#pragma mark - 方法
//关闭
- (void)didClickAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 代理方法
- (void)webViewDidFinishLoad:(UIWebView*)webView
{

    NSString* string = [NSString stringWithFormat:@"document.location.href = '#%@';", self.helpModel.ID];
    //执行脚本
    [webView stringByEvaluatingJavaScriptFromString:string];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
