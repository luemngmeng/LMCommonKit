//
//  LMBaseTableViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/26/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
/*
 *  TbaleViewController的基础类封装
 *  基本只要用到TableViw都可继承此父类
 */

#import "LMBaseViewController.h"

@interface LMBaseTableViewController : LMBaseViewController <UITableViewDataSource,UITableViewDelegate> {
    
}


/**
 *  列表页
 */
@property (nonatomic, strong) UITableView *tableView;


/**
 *  列表的显示风格
 */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;


/**
 *  自定义底部刷新背景界面
 */
@property (nonatomic, strong) UIView *customBottomRefreshBgView;


/**
 *  是否显示自定义刷新功能，开启则将关闭SVPullToRefresh
 */
@property (nonatomic, assign) BOOL isShowCustomBottomRefresh;


/**
 *  是否支持滚动到顶部
 */
@property (nonatomic, assign) BOOL scrollToTopEnable;


/**
 *  默认的cell重用标示符
 */
@property (nonatomic, strong) NSString *defaultCellReuseIdentifier;


/**
 *  列表数据源
 */
@property (nonatomic, strong) NSMutableArray *dataSource;


/**
 *  是否需要刷新当前页面的数据,请求完数据后因该赋值为NO
 */
@property (nonatomic, assign) BOOL needReloadData;



/**
 *  配置tableView
 */
- (void)setupTableView;


/**
 *  通过nib文件名称注册cell
 *
 *  @param nibName    nib文件的名称
 *  @param identifier 重用标示符
 */
- (void)registerCellWithNibName:(NSString *)nibName reuseIdentifier:(NSString *)identifier;


/**
 *  通过类名注册cell
 *
 *  @param className  类名
 *  @param identifier 重用标示符
 */
- (void)registerCellWithClassName:(NSString *)className reuseIdentifier:(NSString *)identifier;


/**
 *  scrollView内容移动到顶层
 *
 *  @param animated 是否开启动画效果
 */
- (void)scrollToTop:(BOOL)animated;


/**
 *  scrollView内容移动到底层
 *
 *  @param animated 是否开启动画效果
 */
- (void)scrollToBottom:(BOOL)animated;


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
- (void)requestTableViewDataSourceSuccess:(NSArray *)dataSource;


/**
 *  列表数据加载失败后调用
 */
- (void)requestTableViewDataSourceFailure;


/**
 *  列表数据加载失败后调用，并带有加载失败的原因
 */
- (void)requestTableViewDataSourceFailureWithResult:(id)result;


@end
