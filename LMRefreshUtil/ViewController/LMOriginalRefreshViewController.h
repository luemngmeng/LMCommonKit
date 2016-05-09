//
//  LMOriginalRefreshViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 5/9/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  默认原始的下拉刷新视图考控制器

#import "LMBaseRefreshViewController.h"

@interface LMOriginalRefreshViewController : LMBaseRefreshViewController


/**
 *  下拉刷新
 */
- (void)pullToRefresh;


/**
 *  加载更多
 */
- (void)infiniteToRefresh;


@end
