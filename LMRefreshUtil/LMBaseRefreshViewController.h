//
//  LMBaseRefreshViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseTableViewController.h"

#import "SVPullToRefresh.h"
//#import "UIScrollView+EmptyDataView.h"
#import "LMLoadMoreView.h"
#import "THTableLoadFailView.h"
#import "THResult.h"

#import "LMPageModel.h"


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

@end
