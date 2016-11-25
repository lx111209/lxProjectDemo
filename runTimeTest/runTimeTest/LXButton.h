//
//  LXButton.h
//  runTimeTest
//
//  Created by iOS-01 on 16/11/22.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface LXButton : UIButton

- (id)initWithFrame:(CGRect)frame withBlock:(ActionBlock)block;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBGColor:(UIColor *)color withCornerRadius:(CGFloat)cornerRadius withBlock:(ActionBlock)block;

@end
