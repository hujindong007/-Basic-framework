//
//  UIView+image.h
//  OC图像优化
//
//  Created by 胡金东 on 2017/6/5.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (image)

-(UIImage *)image:(UIImage *)image size:(CGSize)size backColor:(UIColor *)color cornerRadius:(CGFloat)radius;

@end
