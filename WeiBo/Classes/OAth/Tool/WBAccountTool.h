//
//  WBAccountTool.h
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBAccount;

@interface WBAccountTool : NSObject
+ (void)saveAccount:(WBAccount *)account;
+ (WBAccount *)account;
@end
