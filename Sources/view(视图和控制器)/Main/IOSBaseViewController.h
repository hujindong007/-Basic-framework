//
//  IOSBaseViewController.h
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSBaseViewController : UIViewController

/**
 自定义导航条
 */
@property (nonatomic,strong) UINavigationBar * navBar;
/**
 自定义导航条目
 */
@property (nonatomic,strong) UINavigationItem * navItem;

@property (nonatomic,strong) NSString * stringTitle;

-(void)setUpUI;

@end
