//
//  UIImage+KWJ.m
//  WeiBo
//
//  Created by Jacob on 15/9/9.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "UIImage+KWJ.h"

@implementation UIImage (KWJ)
+ (UIImage *)resizedImageWithName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
