//
//  LXControlTools.m
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "LXControlTools.h"

@implementation LXControlTools

/*
 ===============================================================
 UILabel
 ===============================================================
 */
+ (UILabel *)labelWithFrame:(CGRect)rect withText:(NSString *)text withTextFont:(UIFont *)textFont withTextColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    if (rect.size.width) {
        label.frame = rect;
    }
    if (text.length) {
        label.text = text;
    }
    if (textFont) {
        label.font = textFont;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    return label;
}
/**
 获取文字长度
 @return 各个参数都不能为空
 */
+ (CGFloat)labelGetWidthWithString:(NSString *)string font:(UIFont *)font maxWidth:(CGFloat)width {
    CGSize maximumLabelSize = CGSizeMake(MAXFLOAT, 12);//labelsize的最大值
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    if (size.width > width) {
        return width;
    }
    return size.width + 1;
}
/**
 获取文字高度
 @return 各个参数都不能为空
 */
+ (CGFloat)labelGetHeightWithString:(NSString *)string font:(UIFont *)font width:(CGFloat)width {
    CGSize maximumLabelSize = CGSizeMake(width, MAXFLOAT);//labelsize的最大值
    
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height + 1;
}


/*
 ===============================================================
 UIButton
 ===============================================================
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
                           vc:(id)vc {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    if (color) {
        [button setBackgroundColor:color];
    }
    if (textFont) {
        button.titleLabel.font = textFont;
    }
    if (cornerRadius) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadius];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (sel) {
        [button addTarget:vc action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

//2.no image button
+ (UIButton *)buttonTitleWithFrame:(CGRect)frame
                          withText:(NSString *)text
                      withTextFont:(UIFont *)textFont
                       withBGColor:(UIColor *)color
                  withCornerRadius:(CGFloat)cornerRadius
                       withBGImage:(UIImage *)BGImage
                           withSel:(SEL)sel
                                vc:(id)vc {
    return [[self class] buttonNormalWithFrame:frame withText:text withTextFont:textFont withBGColor:color withCornerRadius:cornerRadius withImage:nil withBGImage:nil withSel:sel vc:vc];
}

//3.no text button
+ (UIButton *)buttonImageWithFrame:(CGRect)frame
                      withBGColor:(UIColor *)color
                 withCornerRadius:(CGFloat)cornerRadius
                        withImage:(UIImage *)image
                          withSel:(SEL)sel
                               vc:(id)vc {
    return [[self class] buttonNormalWithFrame:frame withText:nil withTextFont:nil withBGColor:color withCornerRadius:cornerRadius withImage:image withBGImage:nil withSel:sel vc:vc];
}

/*
 ===============================================================
 UIView
 ===============================================================
 */
+ (UIView *)viewWithFrame:(CGRect)frame BGColor:(UIColor *)BGColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if (BGColor) {
        view.backgroundColor = BGColor;
    }
    return view;
}

/*
 ===============================================================
 UIImageView
 ===============================================================
 */
//加载本地图片
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                     withImageNamed:(NSString *)imageName
                        withBGColor:(UIColor *)BGColor
                   withCornerRadius:(CGFloat)cornerRadius {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName.length) {
        imgView.image = [UIImage imageNamed:imageName];
    }
    if (BGColor) {
        imgView.backgroundColor = BGColor;
    }
    if (cornerRadius) {
        [imgView layerWithIsCorner:YES withRadius:cornerRadius];
    }
    return imgView;
}
//加载网络图片
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                 withImageUrlString:(NSString *)imageUrlString
               withPlaceholderImage:(NSString *)placeholderImageName
                        withBGColor:(UIColor *)BGColor
                   withCornerRadius:(CGFloat)cornerRadius{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    if (imageUrlString.length || placeholderImageName.length) {
        UIImage * placeholderImage = [UIImage imageNamed:placeholderImageName];
        [imgView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            imgView.image = image ? image :placeholderImage;
        }];
    }
    if (BGColor) {
        imgView.backgroundColor = BGColor;
    }
    if (cornerRadius) {
        [imgView layerWithIsCorner:YES withRadius:cornerRadius];
    }
    return imgView;
}


@end
