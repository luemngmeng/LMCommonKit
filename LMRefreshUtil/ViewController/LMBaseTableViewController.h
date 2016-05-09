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
#import "LMCommonkitHeader.h"
#import "UIColor+Extension.h"
#import "Masonry.h"
#import "UIView+Utils.h"

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

@end
