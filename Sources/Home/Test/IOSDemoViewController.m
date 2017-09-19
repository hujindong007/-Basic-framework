//
//  IOSDemoViewController.m
//  Ios基本框架
//
//  Created by 胡金东 on 2017/5/23.
//  Copyright © 2017年 胡金东. All rights reserved.
//

#import "IOSDemoViewController.h"
#import "UIBarButtonItem+Extensions.h"

@interface IOSDemoViewController ()

@end

@implementation IOSDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navItem.title = [NSString stringWithFormat:@"第%zd个",self.navigationController.childViewControllers.count];
    
    
    [self setUpUI];
    
    
    /**
     dispatch_time_t when   :从现在开始经过多少纳秒
     dispatch_queue_t queue :由队列调度任务 block 执行
     dispatch_block_t block :
     */
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    
    dispatch_after(when, dispatch_get_main_queue(), ^{
        NSLog(@"2秒回开始执行");
    });
    
 

    
    
}

-(void)setUpUI
{
    [super setUpUI];
    self.navItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarClick) title:@"下一个" isBack:NO];
    

    
}
-(void)rightBarClick
{
    IOSDemoViewController *demo = [[IOSDemoViewController alloc]init];
    
    [self.navigationController pushViewController:demo animated:YES];
}



@end
