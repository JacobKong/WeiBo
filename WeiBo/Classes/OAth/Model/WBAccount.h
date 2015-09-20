//
//  WBAccount.h
//  WeiBo
//
//  Created by Jacob on 15/9/18.
//  Copyright © 2015年 com.jacob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccount : NSObject <NSCoding>
@property (copy, nonatomic) NSString *access_token;
@property (nonatomic, strong) NSDate *expiresTime; // 账号过期时间
@property (assign, nonatomic) long long expires_in;
@property (assign, nonatomic) long long remind_in;
@property (assign, nonatomic) long long uid;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
