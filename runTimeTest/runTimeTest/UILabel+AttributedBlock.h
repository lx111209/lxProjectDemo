//
//  UILabel+AttributedBlock.h
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^tapLabelBlock)();

@interface UILabel (AttributedBlock)


/**
 自定义部分lable颜色
 */
- (void)labelColorWithChangeColorText:(NSString *)text withTextFontSize:(CGFloat)textFontSize withTextColor:(UIColor *)textColor;

- (void)addTapGuester:(tapLabelBlock)block;

@end
