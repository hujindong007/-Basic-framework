//
//  IOSMainViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSMainViewController.h"
#import "IOSNavigationViewController.h"
#import "IOSBaseViewController.h"

@interface IOSMainViewController ()

@property (nonatomic,strong) NSArray * childsArray;

@property (nonatomic,strong) NSMutableArray *arrayM;

@property (nonatomic,strong) UIButton * composeBtn;

@end

@implementation IOSMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    _arrayM = [NSMutableArray array];
    
    [self setUpChildControllers];
    [self setUpComposeBtn];
    
    
}

#pragma mark  - 创建TabBar控制器
-(void)setUpChildControllers
{
    _childsArray = [[NSArray alloc]init];
    _childsArray = @[
            @{@"ClassName":@"IOSHomeViewController",@"title":@"首页",@"imageName":@"home"},
            @{@"ClassName":@"IOSMessageViewController",@"title":@"消息",@"imageName":@"message_center"},
            @{@"ClassName":@"UIViewController"},
            @{@"ClassName":@"IOSDiscoverViewController",@"title":@"发现",@"imageName":@"discover"},
    @{@"ClassName":@"IOSPodfileViewController",@"title":@"我",@"imageName":@"profile"}
                   ];
   
    
        for (NSDictionary * dict in _childsArray) {
            IOSNavigationViewController *nva = [self
                                           setUpOneChildViewController:dict[@"ClassName"]
                                           image:[NSString stringWithFormat:@"tabbar_%@",dict[@"imageName"]]
                                           selectedImage:[NSString stringWithFormat:@"tabbar_%@_highlighted",dict[@"imageName"]]
                                           title:dict[@"title"]
                                           ];
            [_arrayM addObject:nva];
           
         }
    self.viewControllers = _arrayM;
   }


-(IOSNavigationViewController *)setUpOneChildViewController:(NSString *)VC image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    
    IOSBaseViewController *vc = [[NSClassFromString(VC) alloc]init];

    vc.title = title;
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    // - UIControlStateNormal是可以设置字体大小的 UIControlStateSelected是不可以设置字体大小的
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    vc.tabBarItem.image = [UIImage imageNamed:image];
    // - 渲染改变系统默认的蓝色 UIImageRenderingModeAlwaysOriginal
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    IOSNavigationViewController *nav = [[IOSNavigationViewController alloc]initWithRootViewController:vc];
    return nav;

}


#pragma mark  - 创建发布按钮
-(void)setUpComposeBtn
{
    
    NSInteger count = self.childViewControllers.count;
    // - 减一的目的是让 中间的加号按钮变大，盖住TabBar间距，防止点出覆盖的TabBar事件
    CGFloat W = self.tabBar.bounds.size.width / count;
    //    CGRectInset 正数向内缩进，负数向外扩展 （从两边都缩进）
    self.composeBtn.frame = CGRectInset(self.tabBar.bounds, 2 * W, -20);
    
    [self.tabBar addSubview:self.composeBtn];
    
    
}

#pragma mark  - 发布点击事件


-(void)composeBtnClick
{
    NSLog(@"点击发布");
}

#pragma mark  - 懒加载
-(UIButton *)composeBtn
{
    if (!_composeBtn) {
        _composeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_composeBtn addTarget:self action:@selector(composeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_composeBtn sizeToFit];

    }
    return _composeBtn;
}



@end
