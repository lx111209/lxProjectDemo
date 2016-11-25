//
//  UIButton+block.m
//  Universities
//
//  Created by iOS-03 on 16/4/21.
//  Copyright © 2016年 Th9999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "UIButton+Block.h"

@implementation UIButton(Block)

static char overviewKey;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

- (id)initWithFrame:(CGRect)frame withBlock:(ActionBlock)block {
    self = [super initWithFrame:frame];
    if (self) {
        [self handleControlEvent:UIControlEventTouchUpInside withBlock:block];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBGColor:(UIColor *)color withCornerRadius:(CGFloat)cornerRadius withBlock:(ActionBlock)block withAddView:(UIView *)view {
    self = [super initWithFrame:frame];
    if (self) {
        [self handleControlEvent:UIControlEventTouchUpInside withBlock:block];
        [self setTitle:title forState:UIControlStateNormal];
        [self setBackgroundColor:color];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
    }
    return self;
}


@end
