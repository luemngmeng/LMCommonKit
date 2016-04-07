//
//  LMSegmentView.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/30/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  分段选择器视图

#define TEXT_FONT  THSystemFont([self.segmentItem.normalTextFont intValue])

#import "LMBaseView.h"

#import "LMSegmentItem.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LMSegmentView : LMBaseView

/**
 *  contentButton
 */
@property (nonatomic,strong) UIButton *contentButton;


/**
 *  是否显示红点
 */
@property (nonatomic,assign) BOOL isShowRedDot;


/**
 *  自定义初始化方法
 *
 *  @param frame
 *  @param segmentItem
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame segmentItem:(LMSegmentItem *)segmentItem ;

@end
