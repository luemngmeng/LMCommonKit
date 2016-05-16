//
//  LMBadgeView.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/5/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  小红点视图

#import "LMBaseView.h"

@interface LMBadgeView : LMBaseView


/**
 *  小红点Label
 */
@property (nonatomic,strong) UILabel *badgelabel;


/**
 *  默认的红点（不带标注）
 *
 *  @param frame               frame
 *  @param isShowDefaultRedDot 是否显示红点
 *
 *  @return 带有默认红点的视图
 */
- (instancetype)initWithFrame:(CGRect)frame isShowDefaultRedDot:(BOOL)isShowDefaultRedDot;



/**
 *  带标注的红点
 *
 *  @param frame                  frame
 *  @param isShowMessageTagRedDot 是否显示红点及消息提示标注
 *  @param messageTagValue        消息提示标注的值
 *
 *  @return 返回带有消息提示标注的视图
 */
- (instancetype)initWithFrame:(CGRect)frame isShowMessageTagRedDot:(BOOL)isShowMessageTagRedDot messageTagValue:(NSString *)messageTagValue;

@end
