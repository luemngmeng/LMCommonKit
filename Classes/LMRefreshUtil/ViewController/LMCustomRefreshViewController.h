//
//  LMCustomRefreshViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 5/9/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  自定义下拉刷新视图的控制

#import "LMBaseRefreshViewController.h"


@interface LMCustomRefreshViewController : LMBaseRefreshViewController


/**
 *  自定义底部刷新背景界面
 */
@property (nonatomic, strong) UIView *customBottomRefreshBgView;


/**
 *  是否显示自定义刷新功能，开启则将关闭SVPullToRefresh
 */
@property (nonatomic, assign) BOOL isShowCustomBottomRefresh;


@end
