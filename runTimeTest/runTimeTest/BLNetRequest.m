//
////
////  BLNetRequest.m
////  Universities
////
////  Created by Th9999 on 15/11/8.
////  Copyright © 2015年 Th9999. All rights reserved.
////
//
//#import "BLNetRequest.h"
//#import "AFNetworking.h"
//#import "NSString+Encry.h"
//#import "AppDelegate.h"
//#import "WXUserInfoViewModel.h"
//#import "WXNavigationController.h"
//#import "BLLoginNavController.h"
//
//@implementation BLNetRequest
//static AFHTTPSessionManager *sm;
///**
// *  检测网络的连接状态
// *
// *  @param strUrl 请求地址
// *
// *  @return 是否有网络
// */
//
//+ (AFHTTPSessionManager *)session {
//    if (!sm) {
//        sm = [AFHTTPSessionManager manager];
//        sm.responseSerializer = [AFHTTPResponseSerializer serializer];
//    }
//    return sm;
//}
//
///**
// *  设置请求头
// */
//+ (void)setRequestHeaderWithSession:(AFHTTPSessionManager *)session {
//    [session.requestSerializer setValue:[BLSystemUtils phoneName]
//                     forHTTPHeaderField:@"brand"];
//    [session.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"uid"]
//                     forHTTPHeaderField:@"devicetype"];
//    [session.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"kid"]
//                     forHTTPHeaderField:@"wgroup"];
//    [session.requestSerializer setValue:[BLSystemUtils phoneModel]
//                     forHTTPHeaderField:@"device"];
//    [session.requestSerializer setValue:[BLSystemUtils systemVersion]
//                     forHTTPHeaderField:@"system"];
//    [session.requestSerializer setValue:[BLSystemUtils systemName]
//                     forHTTPHeaderField:@"systemname"];
//    [session.requestSerializer setValue:[BLSystemUtils applicationVersion]
//                     forHTTPHeaderField:@"appversion"];
//    
//}
//
//
///**
// 判断当前网络状态
// */
//+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
//{
//    __block BOOL netState = NO;
//    
//    NSURL *baseURL = [NSURL URLWithString:strUrl];
//    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
//    
//    session.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSOperationQueue *operationQueue = session.operationQueue;
//    
//    [session.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                [operationQueue setSuspended:NO];
//                
//                BOOL isReachable = ((AppDelegate *)[UIApplication sharedApplication].delegate).isReachable;
//                if (isReachable != YES) {
//                    ((AppDelegate *)[UIApplication sharedApplication].delegate).isReachable = YES;
//                }
//                
//                netState = YES;
//                break;
//            case AFNetworkReachabilityStatusNotReachable: {
//                static BOOL Begin = YES;
//                isReachable = ((AppDelegate *)[UIApplication sharedApplication].delegate).isReachable;
//                if (Begin == YES || isReachable != NO) {
//                    ((AppDelegate *)[UIApplication sharedApplication].delegate).isReachable = NO;
//                    Begin = NO;
//                }
//                
//                netState = NO;
//            }
//                
//            default:
//                [operationQueue setSuspended:YES];
//                break;
//        }
//    }];
//    [session.reachabilityManager startMonitoring];
//    
//    return netState;
//}
//
///**
// *  POST请求+密
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock
//                          encryptType: (EncryptType)encryptType
//                          decryptType: (EncryptType)decryptType
//{
//    [[self class] NetRequestPOSTWithRequestURL:requestURLString
//                                 WithParameter:parameter
//                             WithFileParameter:nil
//                          WithReturnValeuBlock:block
//                            WithErrorCodeBlock:errorBlock
//                              WithFailureBlock:failureBlock
//                                   encryptType:encryptType
//                                   decryptType:decryptType];
//}
//
///**
// *  正常POST请求不加密
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock {
//    [[self class] NetRequestPOSTWithRequestURL:requestURLString
//                                 WithParameter:parameter
//                          WithReturnValeuBlock:block
//                            WithErrorCodeBlock:errorBlock
//                              WithFailureBlock:failureBlock
//                                   encryptType:EncryptNone
//                                   decryptType:EncryptNone];
//}
///**
// *  带文件POST请求不加密
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                    WithFileParameter: (NSDictionary *)fileParameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock {
//    [[self class] NetRequestPOSTWithRequestURL:requestURLString
//                                 WithParameter:parameter
//                             WithFileParameter:nil
//                          WithReturnValeuBlock:block
//                            WithErrorCodeBlock:errorBlock
//                              WithFailureBlock:failureBlock
//                                   encryptType:EncryptNone
//                                   decryptType:EncryptNone];
//}
//
///**
// *  带文件POST请求+密
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                    WithFileParameter: (NSDictionary *)fileParameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock
//                          encryptType: (EncryptType)encryptType
//                          decryptType: (EncryptType)decryptType {
//    
//    
//    // 拼接url
//    NSString *URL = [NSString stringWithFormat:@"%@%@",BLAPI, requestURLString];
//    // 传入参数加密
//    NSDictionary *requestPmtDict = [self parameterDic:parameter encryptType:encryptType];
//    
//    
//    //请求头
//    [[self class] setRequestHeaderWithSession:[self session]];
//    
//    
//    
//    [[self session] POST:URL parameters:requestPmtDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        if ([fileParameter isKindOfClass:[NSDictionary class]] && fileParameter.count) {
//            // 上传文件
//            for (NSString *key in fileParameter) {
//                id file = fileParameter[key];
//                if ([file isKindOfClass:[NSDictionary class]]) {
//                    NSData *fileData    = file[@"fileData"];
//                    NSString *fileName  = file[@"fileName"];
//                    NSString *fileType  = file[@"fileType"];
//                    if (fileType.length) {
//                        [formData appendPartWithFileData:fileData name:key fileName:fileName mimeType:fileType];
//                    } else {
//                        [formData appendPartWithFormData:fileData name:key];
//                    }
//                } else if ([file isKindOfClass:[NSArray class]]) {
//                    for (NSDictionary *dic in file) {
//                        
//                        NSData  *fileData    = dic[@"fileData"];
//                        NSString *fileName   = dic[@"fileName"];
//                        NSString *fileType   = dic[@"fileType"];
//                        if (fileType.length) {
//                            [formData appendPartWithFileData:fileData name:key fileName:fileName mimeType:fileType];
//                        } else {
//                            [formData appendPartWithFormData:fileData name:key];
//                        }
//                    }
//                }
//                
//                
//            }
//        }
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%f",uploadProgress.fractionCompleted);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        // 正常返回处理
//        [[self class] successRequestWithResponseObject:responseObject decryptType:decryptType returnBlock:block errorBlock:errorBlock];
//        NSLog(@"%@", requestURLString);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@ %@",requestURLString, error.description);
//        if (failureBlock) {
//            failureBlock();
//        }
//    }];
//}
//
///**
// *  请求成功后的数据处理
// *
// *  @param responseObject 返回流
// *  @param block          正常返回执行block
// *  @param errorBlock     错误返回执行block
// */
//+ (void)successRequestWithResponseObject:(NSData *)responseObject decryptType:(EncryptType)decryptType returnBlock:(ReturnValueBlock)block errorBlock:(ErrorCodeBlock)errorBlock {
//    // 返回密文
//    NSString *returnString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//    
//    // 结果解密
//    NSDictionary *returnDic = [self getReturnDicWithReturnString:returnString encryptType:decryptType];
//    
//    if ([returnDic isKindOfClass:[NSDictionary class]]) {
//        NSLog(@"%@", returnDic);
//        if ([returnDic[CODE] intValue] > 0) {// 正常返回
//            if (block) {
//                block(returnDic);
//            }
//            
//        } else {
////            switch ([returnDic[CODE] intValue]) {
////                case -1001:
////                case -1003:
////                case -1004:
////                case -1005:
////                case -1006:
////                case -114:
////                {
////                    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
////                        
////                    } onQueue:nil];
////                    
////                    [WXUserInfoViewModel clearUserInfo];
////                    [[ApplyViewController shareController] clear];
////                    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
////                    
////                    UIViewController * preVC = [BLSystemUtils getPresentedViewController];
////                    if (![preVC isKindOfClass:[UIAlertController class]]) {
////                        if ([preVC respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
////                            
////                            [preVC dismissViewControllerAnimated:YES completion:^{
////                                
////                            }];
////                        }
////                    } else {
////                                           }
////                    
////                    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
////                    [[WXNavigationController currentNavC] popToRootViewControllerAnimated:YES];
////                    [BLLoginNavController presentFromVC:[WXNavigationController currentNavC]];
////                    
////                    alertWithMessage(@"账号异常，请重新登录");
////                    
////                }
////                    break;
////                case -111:// 异地登陆
////                {
////                    [[NSNotificationCenter defaultCenter] postNotificationName:@"HomeShowHUD" object:@"0"];
////                    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
////                        
////                    } onQueue:nil];
////                    
////                    [WXUserInfoViewModel clearUserInfo];
////                    [[ApplyViewController shareController] clear];
////                    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
////                    
////                    UIViewController * preVC = [BLSystemUtils getPresentedViewController];
////                    if (![preVC isKindOfClass:[UIAlertController class]]) {
////                        if ([preVC respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
////                            
////                            [preVC dismissViewControllerAnimated:YES completion:^{
////                                
////                            }];
////                        }
////                    }
////                    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
////                    [[WXNavigationController currentNavC] popToRootViewControllerAnimated:YES];
////                    [BLLoginNavController presentFromVC:[WXNavigationController currentNavC]];
////                    
////                    NSDictionary *dataDic = returnDic[DATA];
////                    NSString *facility    = dataDic[@"facility"];
////                    NSString *brand       = dataDic[@"brand"];
////                    if (!brand.length) {
////                        brand = @"未知";
////                    }
////                    NSString *time        = dataDic[@"time"];
////                    
////                    NSString *waMsg = [[NSString alloc] initWithFormat:@"你的高校账号于 %@ 在“%@”的%@上登录。如果这不是你本人的操作，你的高校密码可能被盗。请尽快找回密码", [BLDate dateStringWithStamp:time format:@"yyyy-MM-dd HH:mm"], brand, facility];
////                    alertWithMessage(waMsg);
////                    
////                    
////                    
////                }
////                    break;
////                    
////                default: {// 错误返回
////                    if (errorBlock) {
////                        errorBlock(@{MESSAGE: returnDic[MESSAGE], CODE: returnDic[CODE]});
////                    }
////                }
////                    break;
////            }
//            
//        }
//    } else {// 异常返回
//        
//#if DEBUG
//        NSLog(@"%@", returnString);
//        
//        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
//        pboard.string = returnString;
//        
//        [[[UIAlertView alloc] initWithTitle:@"PHPDebug" message:returnString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
//#else
//        
//#endif
//        
//    }
//}
//
///**
// *  返回数据解密
// *
// *  @param returnString 返回的密文
// *  @param decryptType  解密方式
// *
// *  @return 解密后的字典
// */
//+ (NSDictionary *)getReturnDicWithReturnString:(NSString *)returnString encryptType:(EncryptType)decryptType {
//    NSString *deString;
//    switch (decryptType) {
//        case EncryptAES128:
//        {
//            NSString *enctyptKey = [[NSUserDefaults standardUserDefaults] objectForKey:ENCRYPTKEY];
//            deString = [returnString AES128DecryStringWithKey:enctyptKey];
//            if (!deString || [deString isEqualToString:@""]) {
//                deString = [returnString AES128DecryStringWithKey:@"1"];
//            }
//            deString = [deString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\0"]];
//        }
//            break;
//            
//        case EncryptRSA:
//            deString = [returnString RSADecryString];
//            deString = [deString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//            break;
//        case EncryptNone:
//            deString = returnString;
//            break;
//        default:
//            deString = returnString;
//            break;
//    }
//    
//    if (!deString) {
//        NSLog(@"---------Encrypted Return Value：%@",returnString);
//        return nil;
//    }
//    NSLog(@"---------Plaintext Return Value：%@",deString);
//    NSData *jsonData = [deString dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error;
//    NSDictionary *returnDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
//    if (error) {
//        NSLog(@"%@", [error description]);
//        return nil;
//    }
//    return returnDic;
//}
//
///**
// *  参数加密
// *
// *  @param dic         参数列表
// *  @param encryptType 加密方式
// *
// *  @return 加密后的dic
// */
//+ (NSDictionary *)parameterDic:(NSDictionary *)dic encryptType:(EncryptType)encryptType {
//    
//    if (!dic) {
//        dic = [NSDictionary dictionary];
//    }
//    NSMutableDictionary *plantPmt = [NSMutableDictionary dictionaryWithDictionary:dic];
//    
//    // 追加 token
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:U_TOKEN];
//    if (token.length) {
//        [plantPmt setObject:token forKey:TOKEN];
//    }
//    
//    if (encryptType == EncryptNone || encryptType ==nil) {
//        return plantPmt; // 不加密直接返回
//    } else {
//        // dic->string
//        NSData * pmtDate = [NSJSONSerialization dataWithJSONObject:plantPmt options:NSJSONWritingPrettyPrinted error:nil];
//        NSString *encryptPmtString = [[NSString alloc] initWithData:pmtDate encoding:NSUTF8StringEncoding];
//        // 传参加密
//        
//        switch (encryptType) {
//            case EncryptAES128:
//            {
//                NSString *enkey = [[NSUserDefaults standardUserDefaults] objectForKey:ENCRYPTKEY];
//                NSString *uid = UD_(U_ID);
//                if (!uid || !uid.length) {
//                    enkey = @"1";
//                }
//                encryptPmtString = [encryptPmtString AES128EncryStringWithKey:enkey];
//                
//            }
//                break;
//                
//            case EncryptRSA:
//                encryptPmtString = [encryptPmtString RSAEncryString];
//                break;
//                
//            default:
//                return plantPmt;
//        }
//        return @{@"json" :encryptPmtString};
//    }
//}
//
//@end
