//
//  IOSTabBar.h
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/24.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJDTabBar;
// 因为HWTabBar继承自UITabBar，所以称为HWTabBar的代理，也必须实现UITabBar的代理协议
@protocol IOSTabBarDelegate <UITabBarDelegate>

@optional
/**
 *   代理通知HJDTabBarController弹出一个modal控制器
 */

-(void)tabBarClickPlusBtn:(HJDTabBar *)tabBar;

@end


@interface IOSTabBar : UITabBar

@property (nonatomic,weak) id <IOSTabBarDelegate> delegate;

@end
