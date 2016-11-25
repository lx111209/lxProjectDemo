//
//  LXButton.m
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "LXButton.h"
#import <objc/runtime.h>

@implementation LXButton

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
    return [self initWithFrame:frame withTitle:nil withBGColor:nil withCornerRadius:0 withBlock:block];
}

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBGColor:(UIColor *)color withCornerRadius:(CGFloat)cornerRadius withBlock:(ActionBlock)block {
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
