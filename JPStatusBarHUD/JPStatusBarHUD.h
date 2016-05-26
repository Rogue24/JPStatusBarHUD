//
//  JPStatusBarHUD.h
//  JPStatusBarHUD
//
//  Created by ios app on 16/5/26.
//  Copyright © 2016年 cb2015. All rights reserved.
//

/**
 
 版本命名规范：
    1.10.23 ---- 大版本号.功能更新版本号.BUG修复版本号
 
 */

#import <UIKit/UIKit.h>

@interface JPStatusBarHUD : NSObject

+(void)showMessage:(NSString *)text;
+(void)showMessage:(NSString *)text image:(UIImage *)image;
+(void)showSuccess:(NSString *)text;
+(void)showError:(NSString *)text;
+(void)showLoading:(NSString *)text;

+(void)hide;

@end
