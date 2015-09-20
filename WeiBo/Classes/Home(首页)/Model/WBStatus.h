//
//  WBStatus.h
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBUser;

@interface WBStatus : NSObject
/**
 *  微博的内容(文字)
 */
@property (nonatomic, copy) NSString *text;
/**
 *  微博的来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  微博的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  微博的转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  微博的评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  微博的作者
 */
@property (nonatomic, strong) WBUser *user;

+ (instancetype)statusWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
