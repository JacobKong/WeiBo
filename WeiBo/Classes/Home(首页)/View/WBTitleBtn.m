//
//  WBTitleBtn.m
//  WeiBo
//
//  Created by Jacob on 15/9/13.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBTitleBtn.h"
#import "UIImage+KWJ.h"
#define WBTitleButtonImageW 20
@implementation WBTitleBtn
+ (UIButton *)titleBtn{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        // 背景
        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = WBTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - WBTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
