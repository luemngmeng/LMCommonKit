//
//  LMButton.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMButton : UIButton


/**
 *  normal状态下的背景色
 */
@property (nonatomic,strong) UIColor *normalColor;


/**
 *  highlight状态下背景色
 */
@property(nonatomic, strong) UIColor *highlightColor;


/**
 *  disabled状态下背景色
 */
@property (nonatomic, strong) UIColor *disabledColor;


/**
 *  selected状态下背景色
 */
@property (nonatomic, strong) UIColor *selectedColor;


/**
 *  圆角半径
 */
@property(nonatomic, assign)  CGFloat cornerRadius;


/**
 *  显示标题的下划线
 */
@property (nonatomic, assign)  BOOL underlineEnable;

@end
