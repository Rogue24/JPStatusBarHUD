//
//  JPStatusBarHUD.m
//  JPStatusBarHUD
//
//  Created by ios app on 16/5/26.
//  Copyright © 2016年 cb2015. All rights reserved.
//

#import "JPStatusBarHUD.h"

#define JPTextFont [UIFont systemFontOfSize:13]

static CGFloat const JPHUDStayDuration=2.0;         //停留时间
static CGFloat const JPHUDAnimationDuration=0.25;   //动画时间

@implementation JPStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

+(void)showWindow{
    
    //初始化window的位置尺寸
    CGFloat windowHeight=[UIApplication sharedApplication].statusBarFrame.size.height;
    CGRect frame=CGRectMake(0, -windowHeight, [UIScreen mainScreen].bounds.size.width, windowHeight);
    
    //window是个特殊控件，可能令上一个window等于nil还是会有残留的迹象在，防止window会有残留，先让它消失
    window_.hidden=YES;
    
    window_=[[UIWindow alloc] init];
    window_.frame=frame;
    window_.backgroundColor=[UIColor yellowColor];
    window_.windowLevel=UIWindowLevelAlert;
    window_.hidden=NO;
    
    //通过动画显示
    frame.origin.y=0;
    [UIView animateWithDuration:JPHUDAnimationDuration animations:^{
        window_.frame=frame;
    }];
    
}

+(void)showMessage:(NSString *)text image:(UIImage *)image{
    
    //停止计时器（防止上个计时器开启了计时，然后还没过停留时间就执行了hide方法）
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=window_.bounds;
    btn.titleLabel.font=JPTextFont;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
        btn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 5);
    }
    [window_ addSubview:btn];
    
    //开启计时器
    timer_=[NSTimer scheduledTimerWithTimeInterval:JPHUDStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)showMessage:(NSString *)text{
    [self showMessage:text image:nil];
}

+(void)showSuccess:(NSString *)text{
    [self showMessage:text image:[UIImage imageNamed:@"JPStatusBarHUD.bundle/success"]];
}

+(void)showError:(NSString *)text{
    [self showMessage:text image:[UIImage imageNamed:@"JPStatusBarHUD.bundle/wrong"]];
}

+(void)showLoading:(NSString *)text{
    //停止计时器（防止执行hide方法）
    [timer_ invalidate];
    timer_=nil; //销毁计时器
    
    //显示窗口
    [self showWindow];
    
    UILabel *label=[[UILabel alloc] init];
    label.font=JPTextFont;
    label.frame=window_.bounds;
    label.textAlignment=NSTextAlignmentCenter;
    label.text=text;
    label.textColor=[UIColor blackColor];

    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    //获取文字宽度
    CGFloat textWidth=[text sizeWithAttributes:@{NSFontAttributeName:JPTextFont}].width;
    CGFloat centerX=(window_.bounds.size.width-textWidth)/2-20;
    CGFloat centerY=window_.bounds.size.height/2;
    loadingView.center=CGPointMake(centerX, centerY);
    
    [loadingView startAnimating];
    
    [window_ addSubview:loadingView];
}

+(void)hide{
    CGRect frame=window_.frame;
    frame.origin.y=-window_.bounds.size.height;
    [UIView animateWithDuration:JPHUDAnimationDuration animations:^{
        window_.frame=frame;
    } completion:^(BOOL finished) {
        window_=nil;    //销毁窗口
        timer_=nil;     //销毁计时器
    }];
}

@end
