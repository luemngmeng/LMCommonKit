//
//  LMBaseScrollView.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  定义的基类ScrollView

#import "LMBaseView.h"

@interface LMBaseScrollView : LMBaseView

/**
 *  基础类的scrollView
 */
@property (nonatomic,strong) UIScrollView *scrollView;


/**
 *  设置scrollView视图
 */
- (void)setupScrollViewWithModel:(id)model;

@end
