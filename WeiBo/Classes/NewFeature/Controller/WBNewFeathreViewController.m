//
//  WBNewFeathreViewController.m
//  WeiBo
//
//  Created by Jacob on 15/9/13.
//  Copyright (c) 2015年 com.jacob. All rights reserved.
//

#import "WBNewFeathreViewController.h"
#import "WBTabBarViewController.h"
#define WBNewFeatureImageCount 3
#define WBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface WBNewFeathreViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) UIPageControl *pageControl;
@property (weak, nonatomic) UIScrollView *scrollView;
@end

@implementation WBNewFeathreViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    // 设置scrollView
    [self setupScrollView];
    // 设置pageControl
    [self setupPageControl];
    // 设置window背景
    self.view.backgroundColor = WBColor(246, 246, 246);
}

// 设置scrollView
- (void)setupScrollView{
    // 初始化scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    // 设置scrollView内容
    CGFloat imgW = scrollView.frame.size.width;
    CGFloat imgH = scrollView.frame.size.height;
    for (int i = 0; i<WBNewFeatureImageCount ; i++) {
        CGFloat imgX = i*imgW;
        CGFloat imgY = 0;
        
        NSString *imgStr = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        UIImageView *newFeatureImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
        newFeatureImg.frame = CGRectMake(imgX, imgY, imgW, imgH);
        
        [scrollView addSubview:newFeatureImg];
        
        // 在最后一个图片中添加按钮
        if (i == 2) {
            newFeatureImg.userInteractionEnabled = YES;
            [self setupLastImage:newFeatureImg];
        }
    }
    
    scrollView.contentSize = CGSizeMake(WBNewFeatureImageCount * imgW, imgH);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView = scrollView;

}

- (void)setupLastImage:(UIImageView *)imageView{
    // 1.添加开始按钮
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    CGFloat startW = startBtn.currentBackgroundImage.size.width;
    CGFloat startH = startBtn.currentBackgroundImage.size.height;
    CGFloat startX = self.view.center.x - startW * 0.5;
    CGFloat startY =self.view.center.y + 50;
    startBtn.frame = CGRectMake(startX, startY, startW, startH);
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
    
    // 添加分享按钮
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateSelected];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    CGFloat shareW = 150;
    CGFloat shareH = shareBtn.currentImage.size.height;
    CGFloat shareX = self.view.center.x - shareW * 0.5;
    CGFloat shareY =self.view.center.y;
    shareBtn.frame = CGRectMake(shareX, shareY, shareW, shareH);
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
}

- (void)start{
    // 切换窗口根控制器
    self.view.window.rootViewController = [[WBTabBarViewController alloc]init];
}

- (void)share:(UIButton *)sender{
    sender.selected = !sender.selected;
}
// 设置pageControl
- (void)setupPageControl{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    
    // 位置、尺寸
    CGFloat pgW = 100;
    CGFloat pgH = 10;
    CGFloat pgX = self.view.center.x - pgW * 0.5;
    CGFloat pgY = self.view.frame.size.height - 50;
    pageControl.frame = CGRectMake(pgX, pgY, pgW, pgH);
    
    pageControl.numberOfPages = WBNewFeatureImageCount;
    pageControl.pageIndicatorTintColor = WBColor(189, 189, 189);
    pageControl.currentPageIndicatorTintColor = WBColor(274, 99, 43);
    
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double pageDouble = scrollView.contentOffset.x / self.view.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}
@end
