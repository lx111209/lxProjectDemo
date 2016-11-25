//
//  LXShowAlertController.h
//  kdxf_test
//
//  Created by iOS-01 on 16/11/7.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXShowAlertController : NSObject

//提示网络失败
+ (void)showAlertWithNetFail;

//提示信息 一个按钮 无点击事件
+ (void)ShowAlertWithMessage:(NSString*)message;

//提示 有message （最多三个按钮）
+ (void)ShowAlertWithTitleString:(NSString*)title
                      andMessage:(NSString*)message
           andConfirmButtonTitle:(NSString *)ConfirmButtonTitle
                andConfirmAction:(void(^)())ConfirmAction
            andCancelButtonTitle:(NSString *)CancelButtonTitle
                 andCancelAction:(void(^)())CancelAction
       andDestructiveButtonTitle:(NSString *)DestructiveButtonTitle
            andDestructiveAction:(void(^)())DestructiveAction;

@end
