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
#import "WBTabBar.h"

@interface WBTabBarViewController () <WBTabBarDelegate>
@property (strong, nonatomic) WBTabBar *customTabBar;
@end

@implementation WBTabBarViewController

- (void)viewDidLoad {
    // 2.设置tabbar
    [self setupTabBar];

    // 1.添加控制器
    [self setupChildViewControllers];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 删除系统自带的tabberItem
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

/**
 *  添加子控制器
 */
- (void)setupChildViewControllers{
    WBHomeViewController *homeVc = [[WBHomeViewController alloc]init];
//    homeVc.tabBarItem.badgeValue = @"10";
    [self addTabBarItemWithViewController:homeVc title:@"首页" image:@"tabbar_home_os7" selectedImage:@"tabbar_home_selected_os7"];
    
    WBMessageViewController *messageVc = [[WBMessageViewController alloc]init];
    messageVc.tabBarItem.badgeValue = @"2";
    [self addTabBarItemWithViewController:messageVc title:@"消息" image:@"tabbar_message_center_os7" selectedImage:@"tabbar_message_center_selected_os7"];
    
    WBDiscoverViewController *discoverVc = [[WBDiscoverViewController alloc]init];
    discoverVc.tabBarItem.badgeValue = @"100";
    [self addTabBarItemWithViewController:discoverVc title: @"广场" image:@"tabbar_discover_os7" selectedImage:@"tabbar_discover_selected_os7"];
    
    WBMeViewController *meVc = [[WBMeViewController alloc]init];
    meVc.tabBarItem.badgeValue = @"50";
    [self addTabBarItemWithViewController:meVc title: @"我" image:@"tabbar_profile_os7" selectedImage:@"tabbar_profile_selected_os7"];
    
}

/**
 *  设置子控制器的tabbarItem
 */
- (void)addTabBarItemWithViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedimage{
    // 1.设置控制器的属性
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 2.包装导航控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    // 3.添加tabber内部按钮
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

- (void)setupTabBar{
    WBTabBar *customTabBar = [[WBTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

- (void)tabBar:(WBTabBar *)tabBar didSelectedItemFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}
@end
