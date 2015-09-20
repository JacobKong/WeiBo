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
#import "WBAccountTool.h"
#import "WBWeiboTool.h"
#import "MBProgressHUD.h"


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
/**
 *  页面开始加载前调用
 *
 *  @param webView <#webView description#>
 */
- (void)webViewDidStartLoad:(UIWebView *)webView{
    // 显示提示框
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText = @"正在加载";
}

/**
 *  页面加载完毕调用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 隐藏提示框
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 *  加载失败时调用
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    // 隐藏提醒框
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
        [WBAccountTool saveAccount:account];
        
        // 6.选择控制器
        [WBWeiboTool chooseController];
        
        // 7.隐藏提醒框
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 隐藏提醒框
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"请求失败：%@", error);
    }];
    
}
@end
