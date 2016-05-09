//
//  TestFourViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 5/6/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "TestFourViewController.h"

@interface TestFourViewController ()

@end

@implementation TestFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"测试刷新功能,不带下拉刷新界面";
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Method
- (void)requestTableViewDataSource {
    
    [self performSelector:@selector(testMethod) withObject:self afterDelay:3.0];
    
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
    
    //  刷新成功时候回调
    [self requestRefreshTableViewDataSourceSuccess:dateSource];

    
    // 是否显示自定义刷新视图
    if (([self.dataSource count] * 44) <= kCustom_bottom_refresh_bgView_height) {
        self.isShowCustomBottomRefresh = NO;
    } else {
        self.isShowCustomBottomRefresh = YES;
    }
    
}

@end
