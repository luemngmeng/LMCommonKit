//
//  LMRefreshDateSourceLoadingView.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  正在刷新视图（带有动画）

#import "LMBaseView.h"

@interface LMRefreshDateSourceLoadingView : LMBaseView

/**
 *  正在加载视图（带有加载动画）
 */
@property (nonatomic,strong) UIImageView *loadingImageView;


/**
 *  加载中的文字
 */
@property (nonatomic,strong) UILabel *loadingLabel;


@end
