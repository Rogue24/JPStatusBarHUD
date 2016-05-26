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

/** 显示自定义文本 */
+(void)showMessage:(NSString *)text;

/** 显示自定义图文 */
+(void)showMessage:(NSString *)text image:(UIImage *)image;

/** 显示成功信息 */
+(void)showSuccess:(NSString *)text;

/** 显示错误信息 */
+(void)showError:(NSString *)text;

/** 显示加载信息 */
+(void)showLoading:(NSString *)text;

/** 隐藏HUD */
+(void)hide;

@end
