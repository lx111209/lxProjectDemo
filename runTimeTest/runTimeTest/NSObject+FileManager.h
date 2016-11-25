//
//  NSObject+FileManager.h
//  runTimeTest
//
//  Created by iOS-01 on 16/11/23.
//  Copyright © 2016年 iOS-01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FileManager)

/** 类方法获取文件的大小 有回调 */
+ (void)getFileSizeWithFileName:(NSString *)path completion:(void(^)(NSInteger totalSize))completionBlock;
/** 对象方法获取文件的大小 有回调 */
- (void)getFileSizeWithFileName:(NSString *)path completion:(void(^)(NSInteger totalSize))completionBlock;

/** 类方法获取caches路径 */
+ (NSString *)cachesPath;
/** 对象方法获取caches路径 */
- (NSString *)cachesPath;

/** 类方法移除caches 有回调 */
+ (void)removeCachesWithCompletion:(void(^)())completionBlock;
/** 对象方法移除caches 有回调 */
- (void)removeCachesWithCompletion:(void(^)())completionBlock;

@end
