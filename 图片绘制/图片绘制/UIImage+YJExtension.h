//
//  UIImage+YJExtension.h
//  图片绘制
//
//  Created by 冯垚杰 on 2017/11/9.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJExtension)

/**
 图片剪切成圆形
 
 @return 圆形图片
 */
- (UIImage *)yj_circleImage;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)yj_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;



@end
