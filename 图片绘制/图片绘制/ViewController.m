//
//  ViewController.m
//  图片绘制
//
//  Created by 冯垚杰 on 2017/11/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import "ViewController.h"
#import "YJRootManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YJRootManager updateCenterImageWithImgUrl:nil];
    });
    
}






@end
