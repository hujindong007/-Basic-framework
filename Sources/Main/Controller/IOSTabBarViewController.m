//
//  IOSTabBarViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/24.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSTabBarViewController.h"
#import "IOSTabBar.h"
#import "IOSNavigationViewController.h"
#import "IOSComposeViewController.h"

@interface IOSTabBarViewController ()

@property (nonatomic,strong) NSArray * childsArray;

@end

@implementation IOSTabBarViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //自定义tabBar
    IOSTabBar *tabBar = [[IOSTabBar alloc]initWithFrame:self.tabBar.frame];
    //利用KVC把readly的属性改掉
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self setUpViewController];
}



-(void)setUpViewController
{
    _childsArray = [[NSArray alloc]init];
    _childsArray = @[
                     @{@"ClassName":@"IOSHomeViewController",@"title":@"首页",@"imageName":@"home"},
                     @{@"ClassName":@"IOSMessageViewController",@"title":@"消息",@"imageName":@"message_center"},
//                     @{@"ClassName":@"UIViewController"},
                     @{@"ClassName":@"IOSDiscoverViewController",@"title":@"发现",@"imageName":@"discover"},
                @{@"ClassName":@"IOSPodfileViewController",@"title":@"我",@"imageName":@"profile"}
                     ];
    
    for (NSDictionary * dict in _childsArray) {
       
        [self
        setUpOneChildViewController:dict[@"ClassName"]
        image:[NSString stringWithFormat:@"tabbar_%@",dict[@"imageName"]]
        selectedImage:[NSString stringWithFormat:@"tabbar_%@_highlighted",dict[@"imageName"]]
        title:dict[@"title"]
        ];
    }
}
//抽出相同的，在-(void)setUpViewController进行调用就行


-(void)setUpOneChildViewController:(NSString *)VC image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    UIViewController *vc = [[NSClassFromString(VC) alloc]init];

    //可以同时设置tabBar和导航文字
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName];
    [dic setObject:[UIFont boldSystemFontOfSize:17] forKey:NSFontAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    IOSNavigationViewController *nav = [[IOSNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}
//点击加号按钮

-(void)tabBarClickPlusBtn:(HJDTabBar *)tabBar
{
    IOSComposeViewController *demo = [[IOSComposeViewController alloc]init];    
    IOSNavigationViewController *nav = [[IOSNavigationViewController alloc]initWithRootViewController:demo];
    [self presentViewController:nav animated:YES completion:nil];
}




@end
