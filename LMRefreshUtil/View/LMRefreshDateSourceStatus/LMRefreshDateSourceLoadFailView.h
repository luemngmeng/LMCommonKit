//
//  LMRefreshDateSourceLoadFailView.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  刷新数据失败，点击屏幕重新加

#import "LMBaseView.h"
#import <UIKit/UIKit.h>

@protocol LMRefreshDateSourceLoadFailViewDelegate <NSObject>

@optional

/**
 *  服务器加载失败，重新加载
 */
-(void)reloadViewPressedWithRefreshFailure;

@end

@interface LMRefreshDateSourceLoadFailView : LMBaseView


/**
 *  回调对象
 */
@property(nonatomic,weak) id <LMRefreshDateSourceLoadFailViewDelegate> delegate;


@end
