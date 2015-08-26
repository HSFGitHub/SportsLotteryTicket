//
//  HSFHallTableViewController.m
//  SportsLotteryTicket
//
//  Created by 胡双飞 on 15/8/25.
//  Copyright (c) 2015年 HSF. All rights reserved.
//

#import "HSFHallTableViewController.h"

@interface HSFHallTableViewController ()
@property (nonatomic, weak) UIView* cover;
@property (nonatomic, weak) UIImageView* image;

@end

@implementation HSFHallTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - bottonAction
- (IBAction)hallActiviyAction:(id)sender
{

    //1.遮罩层
    UIView* cover = [[UIView alloc] initWithFrame:self.view.frame];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    [self.tabBarController.view addSubview:cover];

    //2.添加图片（这样建立的imageView是有默认尺寸）
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    imageView.userInteractionEnabled = YES;
    imageView.center = self.view.center;
    [self.tabBarController.view addSubview:imageView];

    //3.点击按钮删除图层
    UIButton* btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(imageView.bounds.size.width - 25, 5, 20, 20);
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didClickBtnCloseView) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:btn];
    self.cover = cover;
    self.image = imageView;
}

- (void)didClickBtnCloseView
{

    [self.cover removeFromSuperview];
    [self.image removeFromSuperview];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
