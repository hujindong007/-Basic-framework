//
//  IOSPanTestTwoViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/9/1.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSPanTestTwoViewController.h"
#import "IOSNavigationViewController.h"

@interface IOSPanTestTwoViewController ()

@end

@implementation IOSPanTestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // - 取消右滑返回
    IOSNavigationViewController * nav = (IOSNavigationViewController *)self.navigationController;
    [nav addScreenPopItem:self];

    [self setUpUI];
   }

- (void)setUpUI
{
    [super setUpUI];
}



@end
