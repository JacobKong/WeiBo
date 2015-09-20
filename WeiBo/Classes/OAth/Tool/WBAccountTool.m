//
//  WBAccountTool.m
//  WeiBo
//
//  Created by Jacob on 15/9/20.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"
#define WBAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"account.data"]

@implementation WBAccountTool
+ (void)saveAccount:(WBAccount *)account {
  // 计算账号过期时间
  NSDate *now = [NSDate date];
  account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];

  [NSKeyedArchiver archiveRootObject:account toFile:WBAccountFile];
}

+ (WBAccount *)account {
  WBAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:WBAccountFile];

  NSDate *now = [NSDate date];
  if ([now compare:account.expiresTime] == NSOrderedAscending) { //没有过期
    return account;
  } else { // 过期
    return nil;
  }
}
@end
