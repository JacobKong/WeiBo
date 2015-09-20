//
//  WBUser.h
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject
/**
 *  用户的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  用户的头像
 */
@property (nonatomic, copy) NSString *profile_image_url;
+ (instancetype)userWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
