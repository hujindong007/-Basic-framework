//
//  IOSNavigationViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSNavigationViewController.h"
#import "IOSBaseViewController.h"
#import "UIBarButtonItem+Extensions.h"

@interface IOSNavigationViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) NSMutableArray * popVCArray;

@end

@implementation IOSNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // - 隐藏系统自带，显示自定义的
    [self.navigationBar setHidden:YES];
    
    // 设置手势代理,拖动返回
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    //    gester.delegate = self;
    
    // 自定义手势
    // 手势加在谁身上, 手势执行谁的什么方法
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    // 其实就是控制器的容器视图
    [gester.view addGestureRecognizer:panGester];
    
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;

    // 关闭边缘触发手势 防止和原有边缘手势冲突(好像没有冲突，关不关闭都行)
//    [self.interactivePopGestureRecognizer setEnabled:NO];

    
}
/**
 *  当控制器, 拿到导航控制器(需要是这个子类), 进行压栈时, 都会调用这个方法
 *
 *  @param viewController 要压栈的控制器
 *  @param animated       动画
 */

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 拦截每一个push的控制器, 进行统一设置
    // 过滤第一个根控制器
    // - 如果不是栈底控制器才需隐藏，根控制器不需要隐藏
    if (self.childViewControllers.count > 0) {/// - 大于0就不是根控制器
    // - 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    // - 判断控制器类型
         IOSBaseViewController *base = (IOSBaseViewController *)viewController;
        
        if ([viewController isKindOfClass:[IOSBaseViewController class]]) {
            NSString *title = @"返回";
    // - 如果是第一个子控制器，就显示子控制器的名字，否则就显示返回
        NSLog(@"count==%zd",self.childViewControllers.count);
            if (self.childViewControllers.count == 1) {
    // - title 显示首页的标题 ，
                title = self.childViewControllers.firstObject.title == nil ? @"返回": self.childViewControllers.firstObject.title;
                
            }
    
        base.navItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToPush) title:title isBack:YES];

        }
}
     // 千万不要忘记写
    // - 只能写在下面，写上面无效
    [super pushViewController:viewController animated:animated];
    
}

-(void)popToPush{
    // - 不要在写self.navigationController,
    [self popViewControllerAnimated:YES];
}
#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    
    
    // 根据具体控制器对象决定是否开启全屏右滑返回
    for (UIViewController *viewController in self.popVCArray) {
        if ([self topViewController] == viewController) {
            return NO;
        }
    }

    // 解决右滑和UITableView左滑删除的冲突,右边缘点击闪现下面控制器
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    // 如果根控制器也要返回手势有效, 就会造成假死状态
    // 所以, 需要过滤根控制器
    if(self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}


- (void)addScreenPopItem:(UIViewController *)viewController
{
    if (!viewController) {
        return;
    }
    [self.popVCArray addObject:viewController];
}

- (void)removeFormScreenPopItem:(UIViewController *)viewController
{
    for (UIViewController *vc in self.popVCArray ) {
        if (vc == viewController) {
            [self.popVCArray removeObject:vc];
        }
    }
}

#pragma mark  - SET&&GET

- (NSMutableArray *)popVCArray
{
    if (!_popVCArray) {
        _popVCArray = [[NSMutableArray alloc]init];
        
    }
    return _popVCArray;
}


@end
