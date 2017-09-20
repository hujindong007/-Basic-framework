//
//  IOSMessageViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSMessageViewController.h"
#import "UIBarButtonItem+Extensions.h"
#import "IOSDemoViewController.h"

@interface IOSMessageViewController ()

@property (nonatomic,strong) UIButton *button;


@end

@implementation IOSMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navItem.title = @"消息";
// - 不继承不显示导航栏
    [self setUpUI];
    
    [self.view addSubview:self.button];

    
}

-(void)btnClick:(UIButton *)sender{
    IOSDemoViewController *demo = [[IOSDemoViewController alloc]init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(UIButton *)button{
    
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor redColor];
        _button.frame = CGRectMake(100, 100, 100, 100);
        [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end
