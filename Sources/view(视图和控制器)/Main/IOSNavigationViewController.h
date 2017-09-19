//
//  IOSNavigationViewController.h
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSNavigationViewController : UINavigationController

/**
 添加要右滑返回的控制器
 */
- (void)addScreenPopItem:(UIViewController *)viewController;
/**
 删除已加入数组右滑控制器（这样就不会右滑）
 */
- (void)removeFormScreenPopItem:(UIViewController *)viewController;

@end
