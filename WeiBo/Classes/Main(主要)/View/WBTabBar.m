//
//  WBTabBar.m
//  WeiBo
//
//  Created by Jacob on 15/9/9.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBTabBar.h"
#import "WBTabBarButton.h"
#define tabBarButtonNum 4

@interface WBTabBar ()
@property (strong, nonatomic) WBTabBarButton *selectedBtn;
@end

@implementation WBTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
/**
 *  添加tabber内部按钮
 *
 *  @param item <#item description#>
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item{
    // 创建按钮
    WBTabBarButton *button = [[WBTabBarButton alloc]init];
    [self addSubview:button];
    
    // 设置数据
    button.item = item;
    
    // 监听按钮点击
    [button addTarget:self action:@selector(buttonDidSelected:) forControlEvents:UIControlEventTouchDown];
    
    // 设置第一个按钮点击
    if (self.subviews.count == 1) {
        [self buttonDidSelected:button];
    }
}

- (void)buttonDidSelected:(WBTabBarButton *)button{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        [self.delegate tabBar:self didSelectedItemFrom:self.selectedBtn.tag to:button.tag];
    }
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    
    for (int i = 0; i <  self.subviews.count; i++) {
        WBTabBarButton *button = self.subviews[i];
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 设置tag
        button.tag = i;
    }

}
@end
