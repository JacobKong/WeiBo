//
//  WBSearchBar.m
//  WeiBo
//
//  Created by Jacob on 15/9/13.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBSearchBar.h"
#import "UIImage+KWJ.h"

@implementation WBSearchBar
+ (instancetype)searchBar{
    return [[self alloc]init];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 背景
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];

        // 左边的放大镜图标
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;

        // placeholder
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        textAttrs[UITextAttributeTextColor] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:textAttrs];
        
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        // 返回按钮样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}
@end
