
//
//  IOSHomeViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSHomeViewController.h"
#import "UIBarButtonItem+Extensions.h"
#import "Header.h"

/**
 测试
 */
#import "IOSDemoViewController.h"
#import "IOSPanTestViewController.h"

@interface IOSHomeViewController ()

@property (nonatomic,strong) UIButton * button;
// - 测试全屏右滑返回按钮
@property (nonatomic,strong) UIButton * buttonPan;

@end

@implementation IOSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.buttonPan];
// - 不继承不显示导航栏
//    [self setUpUI];
   
}

- (void)btnClick:(UIButton *)sender{
    IOSDemoViewController *demo = [[IOSDemoViewController alloc]init];
    [self.navigationController pushViewController:demo animated:YES];
}


- (void)btnPan:(UIButton *)sender{
    IOSPanTestViewController * panTest = [[IOSPanTestViewController alloc]init];
    [self.navigationController pushViewController:panTest animated:YES];
}

- (UIButton *)button{

    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor redColor];
        _button.frame = CGRectMake(100, 100, 100, 100);
        [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        /**
         放大点击事件
         */
        // - top, left 正数往右偏  , bottom, right 正数往左偏
        _button.touchExtendInset = UIEdgeInsetsMake(-100, -100, -100, -100);

    }
    return _button;
}


- (UIButton *)buttonPan{
    
    if (!_buttonPan) {
        _buttonPan = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonPan.backgroundColor = [UIColor brownColor];
        _buttonPan.frame = CGRectMake(100, 400, 100, 100);
        [_buttonPan addTarget:self action:@selector(btnPan:) forControlEvents:UIControlEventTouchUpInside];
        /**
         放大点击事件
         */
        // - top, left 正数往右偏  , bottom, right 正数往左偏
        _buttonPan.touchExtendInset = UIEdgeInsetsMake(-10, -10, -10, -10);
        
    }
    return _buttonPan;
}


@end
