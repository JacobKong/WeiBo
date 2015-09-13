//
//  WBDiscoverViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/8.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBDiscoverViewController.h"
#import "WBSearchBar.h"

@interface WBDiscoverViewController () <UITextFieldDelegate>
@property (strong, nonatomic) WBSearchBar *searchBar;
@end

@implementation WBDiscoverViewController

- (void)viewDidLoad {
    WBSearchBar *searchBar = [WBSearchBar searchBar];
    searchBar.frame = CGRectMake(0, 0, 300, 30);
    self.navigationItem.titleView = searchBar;
    self.searchBar = searchBar;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [super viewDidLoad];
}

-(void)dismissKeyboard {
    [self.searchBar resignFirstResponder];
}
@end
