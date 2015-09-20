//
//  WBWeiboTool.m
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBWeiboTool.h"
#import "WBTabBarViewController.h"
#import "WBNewFeathreViewController.h"

@implementation WBWeiboTool
+ (void)chooseController{
    NSString *key = @"CFBundleVersion";
    
    // 从沙盒中取出上一次版本好
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    
    // 取出当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[WBTabBarViewController alloc]init];
    }else{
        // 显示新版本
        [UIApplication sharedApplication].keyWindow.rootViewController = [[WBNewFeathreViewController alloc]init];
        // 存储版本号
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }

}
@end
