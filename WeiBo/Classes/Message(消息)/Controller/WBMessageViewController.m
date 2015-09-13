//
//  WBMessageViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/8.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBMessageViewController.h"

@interface WBMessageViewController ()

@end

@implementation WBMessageViewController

- (void)viewDidLoad {
  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"写私信"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(textPriviteBtnClicked)];
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
- (void)textPriviteBtnClicked {
  NSLog(@"写私信");
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 20;
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
    cell.textLabel.text = @"test";
  }
  return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
