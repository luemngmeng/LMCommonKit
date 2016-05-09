//
//  TestThreeViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  带有刷新功能的视图

#import "TestThreeViewController.h"

@interface TestThreeViewController ()

@end

@implementation TestThreeViewController


#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"测试刷新功能";
    //self.needReloadData = YES;  // 是否开启自动刷新
    self.isPullToRefreshEnable = YES;
    self.isInfiniteToRefreshEnable = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method


#pragma mark - Public Method
- (void)requestTableViewDataSource {
    
    [self performSelector:@selector(testMethod) withObject:self afterDelay:1.0];
    
}


- (void)testMethod {
    
    NSLog(@"刷新结束");
    // 添加测试数据
    NSMutableArray *dateSource = [[NSMutableArray alloc] init];
    NSInteger count =  arc4random() % 10;
    for (int i = 0; i < count ; i++) {
        
        NSString *testStr = [NSString stringWithFormat:@"测试数据 %d",i];
        [dateSource addObject:testStr];
        
    }
    
    
    [self requestRefreshTableViewDataSourceSuccess:dateSource];


}


@end
