//
//  LMBaseRefreshViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseTableViewController.h"

#import "LMPageModel.h"

#import "SVPullToRefresh.h"
#import "LMLoadMoreView.h"
#import "LMRefreshDateSourceLoadFailView.h"

/*
 *  刷新的几种状态视图
 */
#import "LMRefreshDateSourceLoadEmptyView.h"
#import "LMRefreshDateSourceLoadFailView.h"
#import "LMRefreshDateSourceLoadingView.h"
#import "LMRefreshDateSourceNetworkErrorView.h"


// 自定义底部刷新背景视图的高度
#define kCustom_bottom_refresh_bgView_height   100*DEVICE_SCREEN_WIDTH_SCALE_6


/**
 *  tableView 加载状态
 */
typedef NS_ENUM(NSInteger, LMRefreshDateSourceStatus) {
    
    /**
     *  正在加载
     */
    LMRefreshDateSourceStatusLoading,
    
    /**
     *   数据为空
     */
    LMRefreshDateSourceStatusEmpty,
    
    /**
     *   加载失败
     */
    LMRefreshDateSourceStatusFailure,
    
    /**
     *   网络无连接
     */
    LMRefreshDateSourceStatusNetWorkFailure,
    
    /**
     *   加载成功
     */
    LMRefreshDateSourceStatusSuccess,
    
    /**
     *   服务端返回数据异常
     */
    LMRefreshDateSourceStatusProductFormatException,
};


@interface LMBaseRefreshViewController : LMBaseTableViewController


/**
 *  是否需要刷新当前页面的数据,请求完数据后因该赋值为NO
 */
@property (nonatomic, assign) BOOL needReloadData;


/**
 *  是否开启下拉刷新
 */
@property (nonatomic, assign) BOOL isPullToRefreshEnable;


/**
 *  是否开启自动加载更多
 */
@property (nonatomic, assign) BOOL isInfiniteToRefreshEnable;


/**
 *  tableView的加载状态
 */
@property(nonatomic, assign) LMRefreshDateSourceStatus refreshDateSourceStatus;


/**
 *  页面信息
 */
@property (nonatomic, strong) LMPageModel *pageInfo;


#pragma mark **************************************************几种刷新状态视图*************************************************
/**
 *  显示正在加载视图
 */
- (void)showLoadingView;


/**
 *  显示数据库异常加载失败视图
 */
- (void)showLoadFailureWithDatabaseExceptionView;


/**
 *  显示网络错误加载失败视图
 */
- (void)showLoadFailureWithNetworkErrorView;


/**
 *  显示加载成功数据为空视图
 */
- (void)showLoadSuccessWithEmptyDataView;


/**
 *  显示加载成功，回收其他非成功视图
 */
- (void)showViewWithSuccessStatues;


#pragma mark ***************************************加载刷新有关的操作*************************************************
/**
 *  请求列表数据（需重写），需要调用[super requestTableViewDataSource];
 */
- (void)requestTableViewDataSource;


/**
 *  列表数据加载成功后调用
 *
 *  @param dataSource 服务器返回的一页的数据
 */
- (void)requestRefreshTableViewDataSourceSuccess:(NSArray *)dateSource ;


/**
 *  列表数据加载失败后调用
 */
- (void)requestTableViewDataSourceFailure;


/**
 *  列表数据加载失败后调用，并带有加载失败的原因
 */
- (void)requestTableViewDataSourceFailureWithResult:(id)result;



@end
