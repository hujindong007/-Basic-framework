//
//  IOSDiscoverViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSDiscoverViewController.h"
#import "Header.h"

@interface IOSDiscoverViewController ()

@end

@implementation IOSDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // - 不继承不显示导航栏
//    self.navItem.title = @"发现";
    [self setUpUI];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, UIScreenWidth-100, UIScreenWidth-200)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
}



@end
