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


/**
 *  下拉刷新
 */
- (void)pullToRefresh;


/**
 *  加载更多
 */
- (void)infiniteToRefresh;


/**************************************************几种刷新状态视图*************************************************/
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


@end
