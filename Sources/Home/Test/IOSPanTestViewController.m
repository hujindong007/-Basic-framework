//
//  IOSPanTestViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/9/1.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSPanTestViewController.h"
#import "Header.h"


#import "IOSPanTestTwoViewController.h"

@interface IOSPanTestViewController ()

// - 测试全屏右滑返回按钮
@property (nonatomic,strong) UIButton * buttonPan;

@end

@implementation IOSPanTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
    
    [self.view addSubview:self.buttonPan];
    
}

- (void)setUpUI
{
    [super setUpUI];
}

#pragma mark  - buttonPanClick

- (void)btnPanTest:(UIButton *)sender{
    IOSPanTestTwoViewController * panTestTwo = [[IOSPanTestTwoViewController alloc]init];
    [self.navigationController pushViewController:panTestTwo animated:YES];
}


#pragma mark  - SET&&GET

- (UIButton *)buttonPan{
    
    if (!_buttonPan) {
        _buttonPan = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonPan.backgroundColor = [UIColor redColor];
        _buttonPan.frame = CGRectMake(100, 300, 100, 100);
        [_buttonPan addTarget:self action:@selector(btnPanTest:) forControlEvents:UIControlEventTouchUpInside];
        /**
         放大点击事件
         */
        // - top, left 正数往右偏  , bottom, right 正数往左偏
        _buttonPan.touchExtendInset = UIEdgeInsetsMake(-100, -100, -100, -100);
        
    }
    return _buttonPan;
}


@end
