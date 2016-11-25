//
//  BigPic.m
//  bigPicture
//
//  Created by 365-iOS2 on 15/11/11.
//  Copyright © 2015年 WX365. All rights reserved.
//

#import "BigPic.h"
static CGRect oldframe;
@implementation BigPic

+ (void)showImage:(UIImageView*)avatarImageView WithToolBarAction:(SEL)act target:(id)vc
{
    UIImage *image = avatarImageView.image;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backgroundView.tag = 572;
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    
    backgroundView.backgroundColor=[UIColor blackColor];
    
    backgroundView.alpha=0;
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    
    imageView.image=image;
    
    imageView.tag=1;
    
    [backgroundView addSubview:imageView];
    
    [window addSubview:backgroundView];
    
    
    if (act) {
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        leftBtn.frame = CGRectMake(0, backgroundView.frame.size.height - 40, 80, 40);
        [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(tapClick:) forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:leftBtn];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        rightBtn.frame = CGRectMake(backgroundView.frame.size.width - 80, backgroundView.frame.size.height - 40, 80, 40);
        [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [rightBtn addTarget:vc action:act forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:rightBtn];
        
    } else {
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [backgroundView addGestureRecognizer:tap];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-[UIScreen mainScreen].bounds.size.width*image.size.height/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*image.size.height/image.size.width);
        backgroundView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

+ (void)hide {
    [self tapClick:nil];
}

+(void)tapClick:(UITapGestureRecognizer *)tap
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *backgroundView = [window viewWithTag:572];
    
    UIImageView *imageView=(UIImageView*)[backgroundView viewWithTag:1];
    
    [UIView animateWithDuration:0.3
     
     animations:^{
         
        imageView.frame=oldframe;
         
        backgroundView.alpha=0;
         
     }
     completion:^(BOOL finished) {
         
         [backgroundView
          removeFromSuperview];
         
     }];
}
@end
