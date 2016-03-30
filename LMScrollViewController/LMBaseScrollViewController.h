//
//  LMBaseScrollViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  自定义基础scrollView

#import "LMBaseViewController.h"

@interface LMBaseScrollViewController : LMBaseViewController


/**
 *  基础类的scrollView
 */
@property (nonatomic,strong) UIScrollView *scrollView;


/**
 *  设置scrollView视图
 */
- (void)setupScrollView ;

@end
