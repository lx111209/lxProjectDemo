//
//  BigPic.h
//  bigPicture
//
//  Created by 365-iOS2 on 15/11/11.
//  Copyright © 2015年 WX365. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BigPic : NSObject

+ (void)showImage:(UIImageView*)avatarImageView WithToolBarAction:(SEL)act target:(id)vc;
+ (void)hide;

@end
