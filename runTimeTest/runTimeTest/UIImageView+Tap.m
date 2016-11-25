//
//  UIImageView+Tap.m
//  runTimeTest
//
//  Created by iOS-01 on 16/11/23.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "UIImageView+Tap.h"
#import "BigPic.h"

@implementation UIImageView (Tap)

//点击图片放大
- (void)addTapGuesterWithIsEnlarge:(BOOL)IsEnlarge {
    if (IsEnlarge) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(EnlargeClick)];
        [self addGestureRecognizer:tap];
    }
}
- (void)EnlargeClick {
    [BigPic showImage:self WithToolBarAction:nil target:self];
}

//设置图片圆角
- (void)layerWithIsCorner:(BOOL)isCorner withRadius:(CGFloat)Radius {
    if (isCorner) {
        //1
//        self.layer.cornerRadius = Radius;
//        self.layer.masksToBounds = YES; // 裁剪
//        self.layer.shouldRasterize = YES; // 缓存
//        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        //2
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(Radius, 0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

/**
 适用于cell加载网络图片
 */
- (void)imageWithURLString:(NSString *)urlString placeholderImage:(NSString *)placeholder options:(SDWebImageOptions)options layerWithIsCorner:(BOOL)isCorner withRadius:(CGFloat)Radius {
    if (urlString.length || placeholder.length) {
        [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:placeholder] options:options];
    }
    [self layerWithIsCorner:isCorner withRadius:Radius];
}
//加载本地图片
- (void)imageWithLocalImageName:(NSString *)imageName layerWithIsCorner:(BOOL)isCorner withRadius:(CGFloat)Radius {
    if (imageName.length) {
        self.image = [UIImage imageNamed:imageName];
    }
    [self layerWithIsCorner:isCorner withRadius:Radius];
}

- (void)addTapGuesterWithIsOpenCamera:(BOOL)isOpenCamera {
    
}

@end
