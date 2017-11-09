//
//  YJRootManager.m
//  LearnFriendEnterprise
//
//  Created by 冯垚杰 on 2017/11/3.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import "YJRootManager.h"
#import "ViewController.h"
#import "XMLYTabBarViewController.h"
#import "UIImage+YJExtension.h"
#import "AppDelegate.h"


@implementation YJRootManager

+ (void)loadTabBarWithWindow:(UIWindow *)window {
    window.rootViewController = nil;
        XMLYTabBarViewController *tabbarC = [[XMLYTabBarViewController alloc] init];
        
        [tabbarC addTabBarViewWithVCName:@"ViewController" imageName:@"tabbar_find" title:@"首页" selectedImageName:@"tabbar_find_slect"];
        [tabbarC addTabBarViewWithVCName:@"ViewController" imageName:@"tabbar_find" title:@"我学" selectedImageName:@"tabbar_find_slect"];
        
        [tabbarC addTabBarViewWithVCName:@"UIViewController" imageName:@"tabbar_center" title:@"" selectedImageName:@"tabbar_center"];
        [tabbarC addTabBarViewWithVCName:@"ViewController" imageName:@"tabbar_find" title:@"发现" selectedImageName:@"tabbar_find_slect"];
        [tabbarC addTabBarViewWithVCName:@"ViewController" imageName:@"tabbar_find" title:@"我的" selectedImageName:@"tabbar_find_slect"];
        
        window.rootViewController = tabbarC;

    [window makeKeyAndVisible];
}

+ (void)updateCenterImageWithImgUrl:(NSString *)imgUrl {
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    XMLYTabBarViewController *tabbarC = delegate.window.rootViewController;
    

    [tabbarC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 2) {
            obj.image = [[self getCenterImage:[UIImage imageNamed:@"闪屏1"]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        }
    }];
    
    
}

+ (UIImage *)getCenterImage:(UIImage *)image {
    UIImage *top_img = [UIImage imageNamed:@"播放"];
    CGImageRef top_imgRef = top_img.CGImage;
    CGFloat top_w = CGImageGetWidth(top_imgRef);
    CGFloat top_h = CGImageGetHeight(top_imgRef);
    
    
    UIImage *center_img = [UIImage yj_resizeImage:image.yj_circleImage withNewSize:CGSizeMake(138, 138)];
    if (image == nil) {
        center_img = [UIImage imageNamed:@"中间圆"];
    }
    
    CGImageRef center_imgRef = center_img.CGImage;
    CGFloat center_w = CGImageGetWidth(center_imgRef);
    CGFloat center_h = CGImageGetHeight(center_imgRef);
    
    //以1.png的图大小为底图
    UIImage *bottom_img = [UIImage imageNamed:@"底"];
    CGImageRef bottom_imgRef = bottom_img.CGImage;
    CGFloat bottom_w = CGImageGetWidth(bottom_imgRef);
    CGFloat bottom_h = CGImageGetHeight(bottom_imgRef);

    //以1.png的图大小为画布创建上下文
    UIGraphicsBeginImageContext(CGSizeMake(bottom_w, bottom_h));
    
    [bottom_img drawInRect:CGRectMake(0, 0, bottom_w, bottom_h)];//先把1.png 画到上下文中
    [center_img drawInRect:CGRectMake((bottom_w-center_w)/2, (bottom_h-center_h)/2 + 7, center_w, center_h)];//再把小图放在上下文中
    [top_img drawInRect:CGRectMake((bottom_w-top_w)/2, (bottom_h-top_h)/2 + 7, top_w, top_h)];//再把小图放在上下文中
    // 注意:这里不能打开否则会出现野指针,导致崩溃,即使把图片保存至沙盒然后在注销一样会出现问题
//    CGImageRelease(top_imgRef);
//    CGImageRelease(center_imgRef);
//    CGImageRelease(bottom_imgRef);
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
    UIGraphicsEndImageContext();//关闭上下文
    
    return [UIImage yj_resizeImage:resultImg withNewSize:CGSizeMake(60, 60)];
}

@end
