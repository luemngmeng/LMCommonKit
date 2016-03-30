//
//  LMBaseScrollViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseScrollViewController.h"

#import "Masonry.h"

@interface LMBaseScrollViewController ()

@end

@implementation LMBaseScrollViewController

#pragma mark -lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加ScrollView 视图
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

#pragma mark - Public Method
#pragma mark 设置ScrollView 子类可重写这个方法来配置当前的scroolView视图
- (void)setupScrollView {
    
}

@end
