//
//  LMRefreshDateSourceNetworkErrorView.h
//  LMCommonKit
//
//  Created by mengmenglu on 5/3/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseView.h"
#import <UIKit/UIKit.h>

@protocol LMRefreshDateSourceNetworkErrorViewDelegate <NSObject>

@optional
/**
 *  服务器加载失败，重新加载
 */
-(void)reloadViewPressedWithNetworkFailure;


@end


@interface LMRefreshDateSourceNetworkErrorView : LMBaseView

/**
 *  回调对象
 */
@property(nonatomic,weak) id <LMRefreshDateSourceNetworkErrorViewDelegate> delegate;


@end
