//
//  LXShowAlertController.m
//  kdxf_test
//
//  Created by iOS-01 on 16/11/7.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import "LXShowAlertController.h"
#import <UIKit/UIKit.h>

@implementation LXShowAlertController

//提示网络连接失败
+ (void)showAlertWithNetFail {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络原因" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert];
}

//showAlertWithMessage
+ (void)ShowAlertWithTitleString:(NSString*)title
                      andMessage:(NSString*)message
           andConfirmButtonTitle:(NSString *)ConfirmButtonTitle
                andConfirmAction:(void(^)())ConfirmAction
            andCancelButtonTitle:(NSString *)CancelButtonTitle
                 andCancelAction:(void(^)())CancelAction
       andDestructiveButtonTitle:(NSString *)DestructiveButtonTitle
            andDestructiveAction:(void(^)())DestructiveAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (ConfirmButtonTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:ConfirmButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            if (ConfirmAction) {
                ConfirmAction();
            }
        }]];
    }
    
    if (CancelButtonTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:CancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (CancelAction) {
                CancelAction();
            }
        }]];
    }
    
    if (DestructiveButtonTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:DestructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (DestructiveAction) {
                DestructiveAction();
            }
        }]];
    }
    
    [self presentViewController:alert];
}

//提示信息 一个按钮 无点击事件
+ (void)ShowAlertWithMessage:(NSString*)message {
    [self ShowAlertWithTitleString:@"提示" andMessage:message andConfirmButtonTitle:@"确定" andConfirmAction:nil andCancelButtonTitle:nil andCancelAction:nil andDestructiveButtonTitle:nil andDestructiveAction:nil];
}

+(void)presentViewController: (UIViewController*)vController
{
    UIViewController* rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController presentViewController:vController animated:YES completion:nil];
}

@end
