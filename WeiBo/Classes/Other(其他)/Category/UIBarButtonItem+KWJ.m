//
//  UIBarButtonItem+KWJ.m
//  WeiBo
//
//  Created by Jacob on 15/9/13.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "UIBarButtonItem+KWJ.h"

@implementation UIBarButtonItem (KWJ)
+ (UIBarButtonItem *)barButtonItemWithBackgroundImage:(NSString *)image highlightedImage:(NSString *)highlightedImage{
    UIButton *navBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [navBarItem setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [navBarItem setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    navBarItem.bounds = (CGRect){CGPointZero, navBarItem.currentBackgroundImage.size};
    return [[UIBarButtonItem alloc]initWithCustomView:navBarItem];
}
@end
