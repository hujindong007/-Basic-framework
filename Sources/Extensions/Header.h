//
//  Header.h
//  Ios基本框架
//
//  Created by 胡金东 on 2017/6/5.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#ifndef Header_h
#define Header_h


/**
 头文件
 */

#import "UIView+image.h"
#import "UIBarButtonItem+Extensions.h"
#import "UIColor+ColorRandom.h"
// - 放大Btn点击事件
#import "UIView+TouchRect.h"



/**
 获取App的版本号
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BVERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


/**
 屏幕宽度
 */

#define UIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight  [UIScreen mainScreen].bounds.size.height

#define UIStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define UINavigationBarHeight    44
#define UITabBarHeight           49

/**
 设备判断
 */
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_MAX_LENGTH (MAX(UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT))

#define IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
//#define IPHONE_5S (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IPHONE_6_PLUS (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
//#define IPHONE_6S (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//#define IPHONE_6S_PLUS (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)





//...表示宏定义的可变参数
//__VA_ARGS__:表示函数里面的可变参数
#ifdef DEBUG //调试

#define BugLog(...) NSLog(__VA_ARGS__)

#else //发布 调试bug都会清空
#define BugLog(...)

#endif





#endif /* Header_h */
