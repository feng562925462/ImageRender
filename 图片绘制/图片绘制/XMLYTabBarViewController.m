//
//  XMLYTabBarViewController.m
//  LearnFriendEnterprise
//
//  Created by 冯垚杰 on 2017/11/6.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import "XMLYTabBarViewController.h"

@interface XMLYTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation XMLYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tabBar.tintColor = [YJSkinTool yj_mainColor];
    self.delegate = self;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [tabBar.items indexOfObject:item];
    
    if (index == 2) {

    }
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSArray * controllers = self.viewControllers;
    NSInteger index = [controllers indexOfObject:viewController];
    if (index == 2) {
        return NO;
    }
    return YES;
}

#pragma mark - 点击动画
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


- (UIViewController *)addTabBarViewWithVCName:(NSString *)VCName
                                    imageName:(NSString *)imageName
                                        title:(NSString *)title
                            selectedImageName:(NSString *)selectedImageName
{
    UIViewController * VC = [[NSClassFromString(VCName) alloc] init];
    
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    
    VC.tabBarItem.title = title;
    
    VC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    if (!title || title.length <= 0) {
        VC.tabBarItem.imageInsets = UIEdgeInsetsMake(-5.0, 0, 5.0, 0);
    }
    /**
     *  下面方法二选其一
     */
    [self addChildViewController:NC];

    return VC;
}

- (BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.selectedViewController.preferredStatusBarStyle;
}

@end
