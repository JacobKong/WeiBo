//
//  WBNavigationViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/13.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBNavigationViewController.h"

@interface WBNavigationViewController ()

@end

@implementation WBNavigationViewController

- (void)viewDidLoad {
    
        [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    // 设置导航栏主题
    [self setupNavBar];
    //设置导航栏的按钮样式
    [self setupNavBarItem];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBar{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];

    // 设置导航栏字体
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    dict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [navBar setTitleTextAttributes:dict];
    
    // ios6设置主题
//    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
}
/**
 *  设置导航栏的按钮样式
 */
+ (void)setupNavBarItem{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];

}
@end
