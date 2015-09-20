//
//  WBStatus.m
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBStatus.h"
#import "WBUser.h"

@implementation WBStatus
+ (instancetype)statusWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.idstr = dict[@"idstr"];
        self.text = dict[@"text"];
        self.source = dict[@"source"];
        self.reposts_count = [dict[@"reposts_count"] intValue];
        self.comments_count = [dict[@"comments_count"] intValue];
        self.user = [WBUser userWithDict:dict[@"user"]];
    }
    return self;
}
@end
