//
//  XMLYTabBarViewController.h
//  LearnFriendEnterprise
//
//  Created by 冯垚杰 on 2017/11/6.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLYTabBarViewController : UITabBarController

- (UIViewController *)addTabBarViewWithVCName:(NSString *)VCName
                                    imageName:(NSString *)imageName
                                        title:(NSString *)title
                            selectedImageName:(NSString *)selectedImageName;

@end
