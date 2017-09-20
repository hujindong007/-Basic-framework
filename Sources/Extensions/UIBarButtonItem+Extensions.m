//
//  UIBarButtonItem+Extensions.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "UIBarButtonItem+Extensions.h"

@implementation UIBarButtonItem (Extensions)



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
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleHighColor:(UIColor *)highColor titleFont:(CGFloat) font  isBack:(BOOL)isBack {
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (isBack) {
        NSString *imageName = @"navigationbar_back_withtext";
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
        [btn sizeToFit];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:highColor forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
/**
 UIBarButtonItem
 
 @param target target
 @param action action
 @param title title
 @param isBack YES 显示返回箭头 NO 不显示箭头
 @return UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title  isBack:(BOOL)isBack
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (isBack) {
        NSString *imageName = @"navigationbar_back_withtext";
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
        [btn sizeToFit];
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
