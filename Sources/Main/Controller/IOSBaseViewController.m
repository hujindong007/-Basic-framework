//
//  IOSBaseViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSBaseViewController.h"
#import "Header.h"

@interface IOSBaseViewController ()

@end

@implementation IOSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//-(void)setTitle:(NSString *)title
//{
//    _navItem.title = title;
//}
//

-(void)setUpUI{
 
    self.view.backgroundColor = [UIColor randomColor];
    // - 添加自定义导航条
    [self.view addSubview:self.navBar];
    // - 是一个数组，要用@[]包着,将Item 置给bar
    _navBar.items = @[self.navItem];
    // - 设置系统导航push的右边白块曝光度
    _navBar.barTintColor = [UIColor colorWithHex:0xF6F6F6];
}
#pragma mark  - 懒加载
-(UINavigationBar *)navBar
{
    if (!_navBar) {
        _navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        _navBar.backgroundColor = [UIColor redColor];
    }
    return _navBar;
}
-(UINavigationItem *)navItem
{
    if (!_navItem) {
        _navItem = [[UINavigationItem alloc]init];
        
    }
    return _navItem;
}
@end
