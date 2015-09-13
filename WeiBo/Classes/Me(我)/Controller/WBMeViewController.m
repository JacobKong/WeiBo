//
//  WBMeViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/8.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBMeViewController.h"

@interface WBMeViewController ()

@end

@implementation WBMeViewController

- (void)viewDidLoad {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(settingBtnClicked)];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)settingBtnClicked{
    NSLog(@"设置");
}
@end
