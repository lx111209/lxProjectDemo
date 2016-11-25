////
////  BLNetRequest.h
////  Universities
////
////  Created by Th9999 on 15/11/8.
////  Copyright © 2015年 Th9999. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//@interface BLNetRequest : NSObject
//
///**
// 加解密方式
// */
//typedef enum {
//    EncryptNone = 0,
//    EncryptAES128,
//    EncryptRSA,
//    
//}EncryptType;
//
///**
// *  检测网络的连接状态
// *
// *  @param strUrl 请求地址
// *
// *  @return 是否有网络
// */
//+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;
//
///**
// *  正常POST请求+密
// *
// *  @param requestURLString 请求地址
// *  @param parameter        参数列表
// *  @param block            正常回调block
// *  @param errorBlock       错误回调block
// *  @param failureBlock     请求失败block
// *  @param encryptType      传参加密方式
// *  @param decryptType      返回数据解密方式
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock
//                          encryptType: (EncryptType)encryptType
//                          decryptType: (EncryptType)decryptType;
//
///**
// *  正常POST请求
// *
// *  @param requestURLString 请求地址
// *  @param parameter        参数列表
// *  @param block            正常回调block
// *  @param errorBlock       错误回调block
// *  @param failureBlock     请求失败block
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock;
//
///**
// *  带文件POST请求+密
// *
// *  @param requestURLString 请求地址
// *  @param parameter        参数列表
// *  @param fileParameter    文件列表
// *  @param block            正常回调block
// *  @param errorBlock       错误回调block
// *  @param failureBlock     请求失败block
// *  @param encryptType      传参加密方式
// *  @param decryptType      返回数据解密方式
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                    WithFileParameter: (NSDictionary *)fileParameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock
//                          encryptType: (EncryptType)encryptType
//                          decryptType: (EncryptType)decryptType;
//
///**
// *  带文件POST请求
// *
// *  @param requestURLString 请求地址
// *  @param parameter        参数列表
// *  @param fileParameter    文件列表
// *  @param block            正常回调block
// *  @param errorBlock       错误回调block
// *  @param failureBlock     请求失败block
// */
//+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
//                        WithParameter: (NSDictionary *) parameter
//                    WithFileParameter: (NSDictionary *)fileParameter
//                 WithReturnValeuBlock: (ReturnValueBlock) block
//                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
//                     WithFailureBlock: (FailureBlock) failureBlock;
//
///**
// *  返回数据解密
// *
// *  @param returnString 返回的密文
// *  @param decryptType  解密方式
// *
// *  @return 机密后的字典
// */
//+ (NSDictionary *)getReturnDicWithReturnString:(NSString *)returnString encryptType:(EncryptType)decryptType;
//
///**
// *  参数加密
// *
// *  @param dic         参数列表
// *  @param encryptType 加密方式
// *
// *  @return 加密后的字符串
// */
//+ (NSDictionary *)parameterDic:(NSDictionary *)dic encryptType:(EncryptType)encryptType;
//
//@end
