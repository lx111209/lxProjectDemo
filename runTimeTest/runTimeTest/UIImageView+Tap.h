//
//  UIImageView+Tap.h
//  runTimeTest
//
//  Created by iOS-01 on 16/11/23.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (Tap)

//点击图片放大
- (void)addTapGuesterWithIsEnlarge:(BOOL)IsEnlarge;

//图片圆角
- (void)layerWithIsCorner:(BOOL)isCorner withRadius:(CGFloat)Radius;

//加载网络图片
- (void)imageWithURLString:(NSString *)urlString
             placeholderImage:(NSString *)placeholder
                      options:(SDWebImageOptions)options
            layerWithIsCorner:(BOOL)isCorner
                   withRadius:(CGFloat)Radius;

//加载本地图片
- (void)imageWithLocalImageName:(NSString *)imageName layerWithIsCorner:(BOOL)isCorner withRadius:(CGFloat)Radius;

@end
