//
//  WBAccount.m
//  WeiBo
//
//  Created by Jacob on 15/9/18.
//  Copyright © 2015年 com.jacob. All rights reserved.
//

#import "WBAccount.h"

@implementation WBAccount
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)accountWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _access_token = [coder decodeObjectForKey:@"access_token"];
        _expires_in = [coder decodeObjectForKey:@"expires_in"];
        _remind_in = [coder decodeObjectForKey:@"remind_in"];
        _uid = [coder decodeObjectForKey:@"uid"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"_remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}
@end
