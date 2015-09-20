//
//  WBOAthViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/18.
//  Copyright © 2015年 com.jacob. All rights reserved.
//

#import "WBOAthViewController.h"
#import "AFNetworking.h"
#import "WBAccount.h"
#import "WBNewFeathreViewController.h"
#import "WBTabBarViewController.h"

@interface WBOAthViewController ()<UIWebViewDelegate>

@end

@implementation WBOAthViewController

- (void)viewDidLoad {
    // 1.创建webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    // 2.加载授权页面
  NSString *urlStr = @"https://api.weibo.com/oauth2/authorize?client_id=3902141054&redirect_uri=http://www.baidu.com";
  NSURL *url = [NSURL URLWithString:urlStr];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [webView loadRequest:request];
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
#pragma mark - UIWebViewDelegate
/**
 *  webView只要请求页面，就会调用改代理方法，可以在该方法中获取用户授权的requesttoken
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    // 获取url的字符串形式
    NSURL *url = request.URL;
    NSString *urlStr = url.absoluteString;
    
    // 判断字符串中是否有code字符，获取requesttoken
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) { // "code"存在
        unsigned long loc = range.location + range.length;
        NSString *code = [urlStr substringFromIndex:loc];
        [self accessTokenwithCode:code];
        return NO;
    }
    return YES;
}

- (void)accessTokenwithCode:(NSString *)code{
    // 发送post请求，换取access－Token
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer]; // 说明服务器返回的JSON数据
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"3902141054";
    params[@"client_secret"] = @"a59d6429378ec79e668f705b10cb04b2";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";

    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 4.字典转为模型
        WBAccount *account = [WBAccount accountWithDict:responseObject];
        
        // 5.存储模型数据
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *file = [doc stringByAppendingPathComponent:@"account.plist"];
        [NSKeyedArchiver archiveRootObject:account toFile:file];
        
        NSString *key = @"CFBundleVersion";
        
        // 从沙盒中取出上一次版本好
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [defaults stringForKey:key];
        
        // 取出当前版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        
        if ([currentVersion isEqualToString:lastVersion]) {
            self.view.window.rootViewController = [[WBTabBarViewController alloc]init];
        }else{
            // 显示新版本
            self.view.window.rootViewController = [[WBNewFeathreViewController alloc]init];
            // 存储版本号
            [defaults setObject:currentVersion forKey:key];
            [defaults synchronize];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败：％@", error);
    }];
    
}
@end
