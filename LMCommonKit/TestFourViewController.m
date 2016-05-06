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
    self.isShowCustomBottomRefresh = YES;
    
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
    
    if (dateSource.count !=0 ) {
        //[self requestRefreshTableViewDataSourceSuccess:dateSource];
        [self.dataSource addObjectsFromArray:dateSource];
        [self.tableView reloadData];
    }
    
}

@end
