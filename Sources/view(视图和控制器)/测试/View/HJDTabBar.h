//
//  HJDTabBar.h
//  JYHospital
//
//  Created by 胡金东 on 16/3/31.
//  Copyright © 2016年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJDTabBar;
#warning 因为HWTabBar继承自UITabBar，所以称为HWTabBar的代理，也必须实现UITabBar的代理协议
@protocol HJDTabBarDelegate <UITabBarDelegate>

@optional
/**
 *   代理通知HJDTabBarController弹出一个modal控制器
 */

-(void)tabBarClickPlusBtn:(HJDTabBar *)tabBar;

@end



@interface HJDTabBar : UITabBar

@property (nonatomic,weak) id <HJDTabBarDelegate> delegate;


@end
