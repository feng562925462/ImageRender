//
//  YJRootManager.h
//  LearnFriendEnterprise
//
//  Created by 冯垚杰 on 2017/11/3.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YJRootManager : NSObject


+ (void)loadTabBarWithWindow:(UIWindow *)window ;
/**
 更新中心按钮的图片,只在喜马拉雅样式下更新
 */
+ (void)updateCenterImageWithImgUrl:(NSString *)imgUrl;

@end
