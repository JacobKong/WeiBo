//
//  WBTabBarViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/8.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBTabBarViewController.h"
#import "WBHomeViewController.h"
#import "WBMessageViewController.h"
#import "WBDiscoverViewController.h"
#import "WBMeViewController.h"

@interface WBTabBarViewController ()

@end

@implementation WBTabBarViewController

- (void)viewDidLoad {
    // 1.添加控制器
    [self addViewControllers];
        [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  添加子控制器
 */
- (void)addViewControllers{
    WBHomeViewController *homeVc = [[WBHomeViewController alloc]init];
    [self addTabBarItemWithViewController:homeVc title:@"首页" image:@"tabbar_home_os7" selectedImage:@"tabbar_home_selected_os7"];
    
    WBMessageViewController *messageVc = [[WBMessageViewController alloc]init];
    [self addTabBarItemWithViewController:messageVc title:@"消息" image:@"tabbar_message_center_os7" selectedImage:@"tabbar_message_center_selected_os7"];
    
    WBDiscoverViewController *discoverVc = [[WBDiscoverViewController alloc]init];
    [self addTabBarItemWithViewController:discoverVc title: @"广场" image:@"tabbar_discover_os7" selectedImage:@"tabbar_discover_selected_os7"];
    
    WBMeViewController *meVc = [[WBMeViewController alloc]init];
    [self addTabBarItemWithViewController:meVc title: @"我" image:@"tabbar_profile_os7" selectedImage:@"tabbar_profile_selected_os7"];
    
}

/**
 *  设置子控制器的tabbarItem
 */
- (void)addTabBarItemWithViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedimage{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}

@end
