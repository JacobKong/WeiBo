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

@interface WBHomeViewController ()
@property (weak, nonatomic) UIButton *titleBtn;

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    // 创建左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBackgroundImage:@"navigationbar_friendsearch_os7" highlightedImage:@"navigationbar_friendsearch_highlighted_os7"];
    // 设置右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithBackgroundImage:@"navigationbar_pop_os7" highlightedImage:@"navigationbar_pop_highlighted_os7"];
    
    // 设置navBar中间的按钮
    WBTitleBtn *titleBtn = [WBTitleBtn titleBtn];
    [titleBtn setTitle:@"Jacob-JK" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7"] forState:UIControlStateNormal];

    titleBtn.frame = CGRectMake(0, 0, 100, 40);
    [titleBtn addTarget:self action:@selector(titleBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
    self.titleBtn = titleBtn;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)titleBtnClicked {
    self.titleBtn.selected = !self.titleBtn.selected;
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
