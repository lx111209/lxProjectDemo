//
//  UILabel+AttributedBlock.m
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "UILabel+AttributedBlock.h"

static const void *lx_UIButtonBlockKey = &lx_UIButtonBlockKey;

@implementation UILabel (AttributedBlock)

- (void)labelColorWithChangeColorText:(NSString *)text withTextFontSize:(CGFloat)textFontSize withTextColor:(UIColor *)textColor {
    NSString *string = self.text;
    NSRange range = [string rangeOfString:text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    if (textColor) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    }
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:textFontSize] range:range];
    self.attributedText = attributedString;
}

- (void)addTapGuester:(tapLabelBlock)block {
    objc_setAssociatedObject(self, lx_UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabelClick)];
    [self addGestureRecognizer:tap];
}

- (void)tapLabelClick {
    tapLabelBlock block = objc_getAssociatedObject(self, lx_UIButtonBlockKey);
    if (block) {
        block();
    }
}

@end
