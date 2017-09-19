//
//  HJDTabBar.m
//  JYHospital
//
//  Created by 胡金东 on 16/3/31.
//  Copyright © 2016年 胡金东. All rights reserved.
//

#import "HJDTabBar.h"

@interface HJDTabBar()

@property (nonatomic,strong) UIButton *plusBtn;

@end

@implementation HJDTabBar
//咨询预约按钮
//-(UIButton *)plusBtn
//{
//    if (_plusBtn ==nil) {
//        UIButton *consultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//       
//        
//        [consultBtn setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
//        [consultBtn setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateHighlighted];
//        [consultBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
//        [consultBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateHighlighted];
//        
//          _plusBtn = consultBtn;
//        
//        [self addSubview:_plusBtn];
//        [consultBtn sizeToFit];
////        监听按钮点击事件
//        [consultBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        
//
//      
//        
//    }
//    return _plusBtn;
//}


//-(void)plusBtnClick
//{
//    //    通知代理
//    if ([self.delegate respondsToSelector:@selector(tabBarClickPlusBtn:)]) {
//        [self.delegate tabBarClickPlusBtn:self];
//    }
//}

-(void)layoutSubviews
{
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    [super layoutSubviews];
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w/(self.items.count);
    //像微博可以添加按钮
//    CGFloat btnW = w/(self.items.count+1);
    CGFloat btnH = h;
    
    int i = 0;
    //调整系统自带的tabBar上的按钮的位置
    for (UIView *tabBarButton in self.subviews) {
        //tabBarButton从 HJDTabBar类查找，但是直接写不出这个类，所以用放射机制用子控件（UITabBarButton）去找这个类
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //把后两个控件移动一下
//            if (i==3) {
//                i++;
//            }
            btnX = i*btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
//    self.plusBtn.center = CGPointMake(w*0.5+40, h*0.5-30);
//    self.plusBtn.bounds = CGRectMake(0, 0, self.plusBtn.currentBackgroundImage.size.width, self.plusBtn.currentBackgroundImage.size.height);
    
    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"发布";
//    label.font = [UIFont systemFontOfSize:10];
//    [label sizeToFit];
//    label.textColor = [UIColor lightGrayColor];
//    [self addSubview:label];
//    label.centerX = self.plusBtn.centerX;
//    label.centerY = CGRectGetMaxY(self.plusBtn.frame) +18 ;
    

}


////重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
//    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
//    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
//    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
//    if (self.isHidden == NO) {
//        
//        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
//        CGPoint newP = [self convertPoint:point toView:self.plusBtn];
//        
//        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
//        if ( [self.plusBtn pointInside:newP withEvent:event]) {
//            return self.plusBtn;
//        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
//            
//            return [super hitTest:point withEvent:event];
//        }
//    }
//    
//    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
//        return [super hitTest:point withEvent:event];
//    }
//}



@end
