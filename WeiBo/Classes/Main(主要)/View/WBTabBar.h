//
//  WBTabBar.h
//  WeiBo
//
//  Created by Jacob on 15/9/9.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBTabBar;
@protocol WBTabBarDelegate <NSObject>

@optional
- (void)tabBar:(WBTabBar *)tabBar didSelectedItemFrom:(int)from to:(int)to;
- (void)didClickedThePlusBtn;
@end

@interface WBTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@property (weak, nonatomic) id<WBTabBarDelegate> delegate;
@end
