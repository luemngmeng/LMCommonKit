//
//  LMBaseRefreshViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseRefreshViewController.h"

@interface LMBaseRefreshViewController ()

@end

@implementation LMBaseRefreshViewController

#pragma mark - LifeCycle
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.dataSource = [[NSMutableArray alloc] init];
        self.needReloadData = YES;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Setter
#pragma mark 页面管理信息
- (LMPageModel *)pageInfo {
    
    if (!_pageInfo) {
        _pageInfo = [[LMPageModel alloc] init];
    }
    
    return _pageInfo;
}

@end
