//
//  UIView+image.m
//  OC图像优化
//
//  Created by 胡金东 on 2017/6/5.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "UIView+image.h"

@implementation UIView (image)

-(UIImage *)image:(UIImage *)image size:(CGSize)size backColor:(UIColor *)color cornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){CGPointZero,size};
    /// - 1.图像上下文 内存中开辟一个地址，跟屏幕无关
    /**
     size：绘图的尺寸
     opaque: 不透明 false(透明) / true（不透明）
     scale: 屏幕分辨率，默认生成的图像默认使用 1.0 的分辨率，图像质量不好 可以指定 0 会选择当前设备的屏幕分辨率
     */
    /// -  false(透明) / true（不透明），true好，占GPU少
    
    UIGraphicsBeginImageContextWithOptions(size, true, 0);
    
    /// - 0.填充背景
    [color setFill];
    UIRectFill(rect);
    /// - 1.实例化一个圆形的路径
      UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    
    /// - 2.进行路径裁剪 - 后续的绘图，都会出现在圆形内部，外部的全部干掉
    [path addClip];
    /// - 3.绘图 drawInRect 就是在指定区域内拉伸屏幕
  
    [image drawInRect:rect];

    /// - 4.绘制内切的圆形
    [[UIColor redColor] setStroke];
    
    path.lineWidth = 2;
    [path stroke];
  
    /// - 5.取的结果
    image = UIGraphicsGetImageFromCurrentImageContext();

    /// - 6.关闭上下文
    UIGraphicsEndImageContext();
    /// - 7.返回结果
    return image;
    

}

@end
