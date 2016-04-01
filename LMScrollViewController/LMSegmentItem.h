//
//  LMSegmentItem.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/30/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LMSegmentItem : NSObject


/**
 *  title
 */
@property (nonatomic,strong) NSString *title;


/**
 *  normalTitleColor
 */
@property (nonatomic,strong) UIColor *normalTitleColor;


/**
 *  selectTitleColor
 */
@property (nonatomic,strong) UIColor *selectTitleColor;


/**
 *  normalTextFont
 */
@property (nonatomic,strong) NSString *normalTextFont;


/**
 *  selectTextFont
 */
@property (nonatomic,strong) UIFont *selectTextFont;


/**
 *  是否显示红点
 */
@property (nonatomic,assign) BOOL isShowRedDot;


/**
 *  自定义初始化方法
 *
 *  @param title            文本
 *  @param normalTitleColor 文本的字体正常状态的颜色
 *  @param selectTitleColor 文本的字体正常状态的颜色
 *  @param normalTextFont   文本的字体正常状态的颜色
 *  @param isShowRedDot     是否显示红点
 *
 *  @return segmentItem类
 */
- (instancetype)initWithTitle:(NSString *)title
             normalTitleColor:(UIColor *)normalTitleColor
             selectTitleColor:(UIColor *)selectTitleColor
               normalTextFont:(NSString *)normalTextFont
                 isShowRedDot:(BOOL)isShowRedDot;


@end
