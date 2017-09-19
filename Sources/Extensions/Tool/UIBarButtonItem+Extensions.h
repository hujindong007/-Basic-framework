//
//  UIBarButtonItem+Extensions.h
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extensions)
/**
 UIBarButtonItem
 
 @param target target
 @param action action
 @param title title
 @param color 正常字体颜色
 @param highColor 高亮字体颜色
 @param font 字体大小
 @param isBack YES 显示返回箭头 NO 不显示箭头
 @return UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleHighColor:(UIColor *)highColor titleFont:(CGFloat)font isBack:(BOOL)isBack;

/**
 UIBarButtonItem
 
 @param target target
 @param action action
 @param title title
 @param isBack YES 显示返回箭头 NO 不显示箭头
 @return UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title  isBack:(BOOL)isBack;

@end
