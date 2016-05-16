//
//  LMOriginalRefreshViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 5/9/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMOriginalRefreshViewController.h"

@interface LMOriginalRefreshViewController ()

@end

@implementation LMOriginalRefreshViewController

#pragma mark - lifeCycle Method

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 配置下拉刷新和上拉加载更多视图
    [self setupRefreshSubView];
    
    
    // 设置默认的刷新时间
    [self setOldLastRefreshTime];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method
#pragma mark 设置下拉刷新和上拉加载更过的界面
- (void)setupRefreshSubView {
    
    
    __weak __typeof(self) weakSelf = self;
    // 开始加载下拉刷新或上拉加载更过界面
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            // 下拉刷新
            [weakSelf pullToRefresh];
            
        });
    }];
    
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            // 下拉刷新
            [weakSelf infiniteToRefresh];
            
        });
        
    }];
    
    self.isPullToRefreshEnable = YES;
    self.isInfiniteToRefreshEnable = YES;
    self.tableView.pullToRefreshView.textColor = UIColorFromRGB(0x808080);
    self.tableView.pullToRefreshView.arrowColor = UIColorFromRGB(0x808080);
    
}


#pragma mark 设置上次刷新的时间
- (void)setOldLastRefreshTime {
    
    NSString * oldLastRefreshTime = [[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromClass([self class])];
    if ([LMStringUtil isEmptyStringWith:oldLastRefreshTime]) {
        
        [self.tableView.pullToRefreshView setSubtitle:@"暂未更新" forState:SVPullToRefreshStateAll];
        
    } else {
        
        [self.tableView.pullToRefreshView setSubtitle:oldLastRefreshTime forState:SVPullToRefreshStateAll];
    }
}


#pragma mark 更新下拉刷新的时间
- (void)updateLastPullToRefreshTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    
    NSDate *date = [NSDate date];
    NSString *lastRefreshTime = [NSString stringWithFormat:@"更新于: %@", [formatter stringFromDate:date]];
    
    [[NSUserDefaults standardUserDefaults] setObject:lastRefreshTime forKey:NSStringFromClass([self class])];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView.pullToRefreshView setSubtitle:lastRefreshTime forState:SVPullToRefreshStateAll];
    
}


#pragma mark - Public Method
#pragma mark 下拉刷新操作
- (void)pullToRefresh {
    
    NSLog(@"pullToRefresh");
    
    // 初始化页面信息，重新加载第一页
    [self.pageInfo defaultDateInfo];
    self.tableView.showsInfiniteScrolling = NO; // 下拉刷新时，禁掉上拉加载更多
    [self requestTableViewDataSource];
    
}


#pragma mark 上拉加载更多操作
- (void)infiniteToRefresh {
    
    NSLog(@"infiniteScrolling");
    
    self.pageInfo.pageNum++;
    self.tableView.showsPullToRefresh = NO;  // 上拉加载更多时，禁掉下拉刷新
    [self requestTableViewDataSource];
    
}


#pragma mark  列表数据加载成功之后调用
- (void)requestRefreshTableViewDataSourceSuccess:(NSArray *)dateSource {
    
    [super requestRefreshTableViewDataSourceSuccess:dateSource];
    
    // 更新下来刷新时间
    [self updateLastPullToRefreshTime];
}


@end
