//
//  UIButton+block.h
//  Universities
//
//  Created by iOS-03 on 16/4/21.
//  Copyright © 2016年 Th9999. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (block)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block;

- (id)initWithFrame:(CGRect)frame withBlock:(ActionBlock)block;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBGColor:(UIColor *)color withCornerRadius:(CGFloat)cornerRadius withBlock:(ActionBlock)block;

@end
