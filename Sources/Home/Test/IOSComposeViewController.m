//
//  IOSComposeViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/24.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSComposeViewController.h"
#import "UIBarButtonItem+Extensions.h"
#import "IOSDemoViewController.h"

@interface IOSComposeViewController ()

@end

@implementation IOSComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navItem.title = [NSString stringWithFormat:@"第%zd个",self.navigationController.childViewControllers.count];
    self.navItem.title = @"发布";
    [self setUpUI];
}

-(void)setUpUI
{
    [super setUpUI];
    self.navItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(BackClick) title:@"返回" isBack:YES];
 
    self.navItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarClick) title:@"下一个" isBack:NO];
}
-(void)rightBarClick
{
    IOSDemoViewController *demo = [[IOSDemoViewController alloc]init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)BackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
