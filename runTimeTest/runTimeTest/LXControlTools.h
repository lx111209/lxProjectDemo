//
//  LXControlTools.h
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIImageView+WebCache.h"
#import "UIImageView+Tap.h"
#import "IQTextView.h"

@interface LXControlTools : NSObject

/**
 Label
 */
+ (UILabel *)labelWithFrame:(CGRect)rect withText:(NSString *)text withTextFont:(UIFont *)textFont withTextColor:(UIColor *)textColor;

/**
 Button
 */
//1.normal button
+ (UIButton *)buttonNormalWithFrame:(CGRect)frame
                           withText:(NSString *)text
                       withTextFont:(UIFont *)textFont
                        withBGColor:(UIColor *)color
                   withCornerRadius:(CGFloat)cornerRadius
                          withImage:(UIImage *)image
                        withBGImage:(UIImage *)BGImage
                            withSel:(SEL)sel
                                 vc:(id)vc;
//2.no image button
+ (UIButton *)buttonTitleWithFrame:(CGRect)frame
                          withText:(NSString *)text
                      withTextFont:(UIFont *)textFont
                       withBGColor:(UIColor *)color
                  withCornerRadius:(CGFloat)cornerRadius
                       withBGImage:(UIImage *)BGImage
                           withSel:(SEL)sel
                                vc:(id)vc;
//3.no text button
+ (UIButton *)buttonImageWithFrame:(CGRect)frame
                       withBGColor:(UIColor *)color
                  withCornerRadius:(CGFloat)cornerRadius
                         withImage:(UIImage *)image
                           withSel:(SEL)sel
                                vc:(id)vc;

/**
 View
 */
+ (UIView *)viewWithFrame:(CGRect)frame BGColor:(UIColor *)BGColor;

/**
 ImageView
 */
//加载本地图片
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                     withImageNamed:(NSString *)imageName
                        withBGColor:(UIColor *)BGColor
                   withCornerRadius:(CGFloat)cornerRadius;
//加载网络图片
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                 withImageUrlString:(NSString *)imageUrlString
               withPlaceholderImage:(NSString *)placeholderImageName
                        withBGColor:(UIColor *)BGColor
                   withCornerRadius:(CGFloat)cornerRadius;

@end
