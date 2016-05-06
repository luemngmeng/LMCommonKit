//
//  LMBaseRefreshViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseRefreshViewController.h"
#import "UIColor+Extension.h"

@interface LMBaseRefreshViewController ()


/**
 *  正在加载视图
 */
@property (nonatomic,strong) LMRefreshDateSourceLoadingView *loadingView;


/**
 *  数据库异常加载失败视图
 */
@property (nonatomic,strong) LMRefreshDateSourceLoadFailView *loadFailureWithDatabaseExceptionView;


/**
 *  网络错误加载失败视图
 */
@property (nonatomic,strong) LMRefreshDateSourceNetworkErrorView *loadFailureWithNetworkErrorView;


/**
 *  加载成功数据为空视图
 */
@property (nonatomic,strong) LMRefreshDateSourceLoadEmptyView *loadSuccessWithEmptyDataView;


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
    
    // 配置下拉刷新和上拉加载更多视图
    [self setupRefreshSubView];

}


- (void)viewDidAppear:(BOOL)animated {
    
    [super  viewDidAppear:animated];
    
    if(self.needReloadData) {  // 在视图开始加载的时候，就自动刷新
        
        self.refreshDateSourceStatus = LMRefreshDateSourceStatusLoading;
        [self requestTableViewDataSource];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Private Method
#pragma mark - Setter Method
#pragma mark 页面管理信息
- (LMPageModel *)pageInfo {
    
    if (!_pageInfo) {
        _pageInfo = [[LMPageModel alloc] init];
    }
    
    return _pageInfo;
}


#pragma mark 正在加载视图
- (LMRefreshDateSourceLoadingView *)loadingView {
    
    if (!_loadingView) {
        _loadingView = [[LMRefreshDateSourceLoadingView alloc] initWithFrame:self.view.bounds];
    }
    
    return _loadingView;
}


#pragma mark 数据库异常加载失败视图
- (LMRefreshDateSourceLoadFailView *)loadFailureWithDatabaseExceptionView {
    
    if (!_loadFailureWithDatabaseExceptionView) {
        _loadFailureWithDatabaseExceptionView = [[LMRefreshDateSourceLoadFailView alloc] initWithFrame:self.view.bounds];
    }
    
    return _loadFailureWithDatabaseExceptionView;
}


#pragma mark 网络错误加载失败视图
- (LMRefreshDateSourceNetworkErrorView *)loadFailureWithNetworkErrorView {
    
    if (!_loadFailureWithNetworkErrorView) {
        _loadFailureWithNetworkErrorView = [[LMRefreshDateSourceNetworkErrorView alloc] initWithFrame:self.view.bounds];
    }
    
    return _loadFailureWithNetworkErrorView;
}


#pragma mark 加载成功数据为空视图
- (LMRefreshDateSourceLoadEmptyView *)loadSuccessWithEmptyDataView {
    
    if (!_loadSuccessWithEmptyDataView) {
        _loadSuccessWithEmptyDataView = [[LMRefreshDateSourceLoadEmptyView alloc] initWithFrame:self.view.bounds];
    }
    
    return _loadSuccessWithEmptyDataView;
}


#pragma mark 显示正在加载视图
- (void)showLoadingView {
    
    self.loadingView.alpha = 1;
    [self.view addSubview:self.loadingView];
    [self.view bringSubviewToFront:self.loadingView];
    
}


#pragma mark 显示数据库异常加载失败视图
- (void)showLoadFailureWithDatabaseExceptionView {
    
    self.loadFailureWithDatabaseExceptionView.alpha = 1;
    [self.view addSubview:self.loadFailureWithDatabaseExceptionView];
    [self.view bringSubviewToFront:self.loadFailureWithDatabaseExceptionView];
    
}


#pragma mark 显示网络错误加载失败视图
- (void)showLoadFailureWithNetworkErrorView {
    
    self.loadFailureWithNetworkErrorView.alpha = 1;
    [self.view addSubview:self.loadFailureWithNetworkErrorView];
    [self.view bringSubviewToFront:self.loadFailureWithNetworkErrorView];
    
}


#pragma mark 显示加载成功数据为空视图
- (void)showLoadSuccessWithEmptyDataView {
    
    self.loadSuccessWithEmptyDataView.alpha = 1;
    [self.view addSubview:self.loadSuccessWithEmptyDataView];
    [self.view bringSubviewToFront:self.loadSuccessWithEmptyDataView];
    
}



#pragma mark 显示加载成功，回收其他非成功视图
- (void)showViewWithSuccessStatues {
    
    
    if (self.loadingView) {
        if (self.loadingView.loadingImageView.isAnimating) {
            [self.loadingView.loadingImageView stopAnimating];
        }
        [self dismissViewWithShowView:self.loadingView animation:YES];
    }
    
    
    if (self.loadFailureWithDatabaseExceptionView) {
        [self dismissViewWithShowView:self.loadFailureWithDatabaseExceptionView animation:YES];
    }
    
    
    if (self.loadFailureWithNetworkErrorView) {
        [self dismissViewWithShowView:self.loadFailureWithNetworkErrorView animation:YES];
    }
    
    
    if (self.loadSuccessWithEmptyDataView) {
        [self dismissViewWithShowView:self.loadSuccessWithEmptyDataView animation:YES];
    }
    
}


#pragma mark 隐藏几种刷新状态的视图(是否带有动画)
- (void)dismissViewWithShowView:(UIView *)showView animation:(BOOL)animation{
    
    
    if (!animation) { //  不带有动画
        
        
        if (showView) {
            
            [showView removeFromSuperview];
            showView = nil;
        
        }
        
    } else {  // 带有动画，执行动画的时间是3秒
        
        if (showView) {
            
            [UIView animateWithDuration:0.3 animations:^{
                showView.alpha = 0;
            } completion:^(BOOL finished) {
                [showView removeFromSuperview];
            }];
            
        }
        
    }

}


#pragma mark  设置加载状态
- (void)setRefreshDateSourceStatus:(LMRefreshDateSourceStatus)refreshDateSourceStatus {
    
    
    _refreshDateSourceStatus = refreshDateSourceStatus;
    
    switch (refreshDateSourceStatus) {
            
        case LMRefreshDateSourceStatusLoading: {  //  正在加载视图
            
            [self showLoadingView];
            break;
        }
            
        case LMRefreshDateSourceStatusFailure: {  //  数据库异常加载失败
            
            [self showLoadFailureWithDatabaseExceptionView];
            break;
        }
            
        case LMRefreshDateSourceStatusNetWorkFailure:  {  //  网络错误加载失败
            
            [self showLoadFailureWithNetworkErrorView];
            break;
        }
            
        case LMRefreshDateSourceStatusEmpty: {  //  加载成功数据为空
            
            [self showLoadSuccessWithEmptyDataView];
            break;
        }
            
        case LMRefreshDateSourceStatusSuccess: {  //  加载成功
            
            [self showViewWithSuccessStatues];
            break;
        }
            
        default:
            
            [self showViewWithSuccessStatues];  // 默认也是加载成功
            break;
    }
}


#pragma mark 设置下拉刷新是否启用
- (void)setIsPullToRefreshEnable:(BOOL)isPullToRefreshEnable {
    
    _isPullToRefreshEnable = isPullToRefreshEnable;
    self.tableView.showsPullToRefresh = isPullToRefreshEnable;
    
}


#pragma mark 设置上拉加载更多是否启用
- (void)setIsInfiniteToRefreshEnable:(BOOL)isInfiniteToRefreshEnable {
    
    _isInfiniteToRefreshEnable = isInfiniteToRefreshEnable;
    self.tableView.showsInfiniteScrolling = isInfiniteToRefreshEnable;
    
}


#pragma mark 设置下拉刷新和上拉加载更过的界面
- (void)setupRefreshSubView {
    
    self.isPullToRefreshEnable = YES;
    self.isInfiniteToRefreshEnable = YES;
    self.tableView.pullToRefreshView.textColor = UIColorFromRGB(0x808080);
    self.tableView.pullToRefreshView.arrowColor = UIColorFromRGB(0x808080);
    
    
    if (self.isShowCustomBottomRefresh) {
        self.isPullToRefreshEnable = NO;
    }
    
    
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


#pragma mark 请求列表数据（需重写）
- (void)requestTableViewDataSource {
    
    [self requestRefreshTableViewDataSourceSuccess:nil];
    
}


#pragma mark 列表数据加载成功之后调用
- (void)requestRefreshTableViewDataSourceSuccess:(NSArray *)dateSource {
    
    NSLog(@"requestTableViewDataSourceSuccess");
    
    self.tableView.showsPullToRefresh = self.isPullToRefreshEnable;
    self.tableView.showsInfiniteScrolling = self.isInfiniteToRefreshEnable;
    
    
    // 更新下来刷新时间
    [self updateLastPullToRefreshTime];
    
    
    // 执行下拉刷新操作后（在第一页刷新的时候）
    if (self.pageInfo.pageNum == 1) { // 大部分是在下拉刷新的时候（偶尔会出现上拉加载更过，除非第所有数据小于=一页数据的总和）
        
        //结束下拉刷新操作
        if (self.tableView.pullToRefreshView.state == SVPullToRefreshStateLoading) {
            [self.tableView.pullToRefreshView stopAnimating];
        }
        
        // 不需要将内容移动到最顶端
        [self scrollToTop:NO];
        
        // 加载第一页数据的时候，清空旧数据
        [self.dataSource removeAllObjects];
    }
    
    
    // 执行上拉加载更多操作后（不在最后一页）
    if (self.pageInfo.pageNum > 1 && self.pageInfo.pageNum < self.pageInfo.totalPage) {
        
        // 结束上拉加载更过的操作
        if (self.tableView.infiniteScrollingView.state == SVPullToRefreshStateLoading) {
            [self.tableView.infiniteScrollingView stopAnimating];
        }
    }
    
    
    // 执行上拉加载更多操作后（到达最后一页）
    if (self.pageInfo.pageNum == self.pageInfo.totalPage && self.pageInfo.totalPage > 0 ) {
        
        // 结束上拉加载更改操作
        self.tableView.showsInfiniteScrolling = NO;
        [self.tableView.infiniteScrollingView stopAnimating];
        self.refreshDateSourceStatus = LMRefreshDateSourceStatusSuccess;
    }
    
    
    // 加载最新的数据源
    if ([dateSource  count] > 0 ) {
        
        [self.dataSource addObjectsFromArray:dateSource];
        
    }
    
    
    
    // 处理最新加载数据源的结果
    if ([self.dataSource count] == 0) {  // 可以下拉刷新，但是无法上拉下载更多
        
        self.tableView.showsInfiniteScrolling = NO;
        [self.tableView.infiniteScrollingView stopAnimating];
        [self.tableView.pullToRefreshView stopAnimating];
        self.refreshDateSourceStatus = LMRefreshDateSourceStatusEmpty;
        
    } else {
        
        self.refreshDateSourceStatus = LMRefreshDateSourceStatusSuccess;

    }
    
    // 充值刷新的状态，开始刷新对应的tableView
    self.needReloadData = NO;
    [self.tableView reloadData];
    
}


@end
