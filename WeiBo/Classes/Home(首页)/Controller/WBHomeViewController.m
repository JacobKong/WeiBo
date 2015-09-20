//
//  WBHomeViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/8.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBHomeViewController.h"
#import "UIBarButtonItem+KWJ.h"
#import "UIImage+KWJ.h"
#import "WBTitleBtn.h"
#import "AFNetworking.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "UIImageView+WebCache.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "MJExtension.h"

@interface WBHomeViewController ()
@property(weak, nonatomic) UIButton *titleBtn;
@property(strong, nonatomic) NSArray *statuses;

@end

@implementation WBHomeViewController

- (NSArray *)statusArray {
  if (!_statuses) {
    _statuses = [NSArray array];
  }
  return _statuses;
}
- (void)viewDidLoad {
  [self setupNavBarBtn];
  [self setupStatus];
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

/**
 *  获取微博数据并赋给模型数据
 */
- (void)setupStatus {
  AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
  mgr.responseSerializer = [AFJSONResponseSerializer serializer];

  // 创建account
  WBAccount *account = [WBAccountTool account];

  // 传参
  NSMutableDictionary *params = [NSMutableDictionary dictionary];
  params[@"access_token"] = account.access_token;

  [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json"
      parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          self.statuses = [WBStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
          
          [self.tableView reloadData];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error){

      }];
}
/**
 *  设置导航栏左中右的按钮
 */
- (void)setupNavBarBtn {
  // 创建左边按钮
  self.navigationItem.leftBarButtonItem = [UIBarButtonItem
      barButtonItemWithBackgroundImage:@"navigationbar_friendsearch_os7"
                      highlightedImage:
                          @"navigationbar_friendsearch_highlighted_os7"];
  // 设置右边按钮
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem
      barButtonItemWithBackgroundImage:@"navigationbar_pop_os7"
                      highlightedImage:@"navigationbar_pop_highlighted_os7"];

  // 设置navBar中间的按钮
  WBTitleBtn *titleBtn = [WBTitleBtn titleBtn];
  [titleBtn setTitle:@"Jacob-JK" forState:UIControlStateNormal];
  [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7"]
            forState:UIControlStateNormal];
  [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up_os7"]
            forState:UIControlStateSelected];

  titleBtn.frame = CGRectMake(0, 0, 130, 40);
  [titleBtn addTarget:self
                action:@selector(titleBtnClicked)
      forControlEvents:UIControlEventTouchUpInside];
  self.navigationItem.titleView = titleBtn;
  self.titleBtn = titleBtn;
}
- (void)titleBtnClicked {
  self.titleBtn.selected = !self.titleBtn.selected;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.statusArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *ID = @"message";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
  // 如果缓存池中没有该ID的cell，则创建一个新的cell
  if (cell == nil) {
    // 创建一个新的cell
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                  reuseIdentifier:ID];
  }
    // 设置cell数据
    WBStatus *status = self.statuses[indexPath.row];
    cell.textLabel.text = status.text;
    
    // 微博作者的昵称
    WBUser *user = status.user;
    cell.detailTextLabel.text = user.name;
    
    // 微博作者的头像
    NSString *iconUrl = user.profile_image_url;
    [cell.imageView setImageWithURL:[NSURL URLWithString:iconUrl]
                   placeholderImage:[UIImage imageNamed:@"tabbar_slider"]];
  return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIViewController *vc = [[UIViewController alloc] init];
  vc.view.backgroundColor = [UIColor blueColor];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
