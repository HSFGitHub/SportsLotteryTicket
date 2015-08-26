//
//  HSFLuckViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/26.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFLuckViewController.h"

@interface HSFLuckViewController ()
@property (weak, nonatomic) IBOutlet UIImageView* luckImageView;

@end

@implementation HSFLuckViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray* imgs = @[ [UIImage imageNamed:@"lucky_entry_light0"], [UIImage imageNamed:@"lucky_entry_light1"] ];
    self.luckImageView.animationImages = imgs;
    self.luckImageView.animationDuration = 0.5;
    [self.luckImageView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
