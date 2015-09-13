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
@property(strong, nonatomic) WBTabBarButton *selectedBtn;
@property(weak, nonatomic) UIButton *plusBtn;
@property(strong, nonatomic) NSMutableArray *tabBarBtnArray;
@end

@implementation WBTabBar

- (NSMutableArray *)tabBarBtnArray {
  if (_tabBarBtnArray == nil) {
    _tabBarBtnArray = [NSMutableArray array];
  }
  return _tabBarBtnArray;
}
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupPlusBtn];
  }
  return self;
}
- (void)setupPlusBtn {
  // 添加加号按钮
  UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_os7"]
                     forState:UIControlStateNormal];
  [plusBtn setBackgroundImage:
               [UIImage imageNamed:@"tabbar_compose_button_highlighted_os7"]
                     forState:UIControlStateHighlighted];
  [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_os7"]
           forState:UIControlStateNormal];
  [plusBtn
      setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7"]
      forState:UIControlStateHighlighted];
  [self addSubview:plusBtn];
  self.plusBtn = plusBtn;
    [self.plusBtn addTarget:self action:@selector(plusBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)plusBtnClicked{
    if ([self.delegate respondsToSelector:@selector(didClickedThePlusBtn)]) {
        [self.delegate didClickedThePlusBtn];
    }
}
/**
 *  添加tabber内部按钮
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item {

  // 创建按钮
  WBTabBarButton *button = [[WBTabBarButton alloc] init];
  [self addSubview:button];

  // 设置数据
  button.item = item;

  // 监听按钮点击
  [button addTarget:self
                action:@selector(buttonDidSelected:)
      forControlEvents:UIControlEventTouchDown];

  // 设置第一个按钮点击
  if (self.tabBarBtnArray.count == 0) {
    [self buttonDidSelected:button];
  }
  [self.tabBarBtnArray addObject:button];
  //    NSLog(@"%@", _tabBarBtnArray);
}

- (void)buttonDidSelected:(WBTabBarButton *)button {
  if ([self.delegate
          respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
    [self.delegate tabBar:self
        didSelectedItemFrom:(int)self.selectedBtn.tag
                         to:(int)button.tag];
  }
  self.selectedBtn.selected = NO;
  button.selected = YES;
  self.selectedBtn = button;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  // 设置plusBtn的frame
  self.plusBtn.center = self.center;
  CGFloat plusBtnW = self.plusBtn.currentBackgroundImage.size.width;
  CGFloat plusBtnH = self.plusBtn.currentBackgroundImage.size.height;
  self.plusBtn.bounds = CGRectMake(0, 0, plusBtnW, plusBtnH);

  CGFloat buttonW = self.frame.size.width / self.subviews.count;
  CGFloat buttonH = self.frame.size.height;
  CGFloat buttonY = 0;

  for (int i = 0; i < self.tabBarBtnArray.count; i++) {
    WBTabBarButton *button = self.tabBarBtnArray[i];
    if (i > 1) {
      CGFloat buttonX = (i + 1) * buttonW;
      //            NSLog(@"---%f", buttonX);
      button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);

    } else {
      CGFloat buttonX = i * buttonW;
      button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }

    // 设置tag
    button.tag = i;
  }
}
@end
