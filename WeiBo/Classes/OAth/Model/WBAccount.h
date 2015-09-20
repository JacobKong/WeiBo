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
@property (copy, nonatomic) NSString *expires_in;
@property (copy, nonatomic) NSString *remind_in;
@property (copy, nonatomic) NSString *uid;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
