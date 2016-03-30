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
 *  是否显示红点
 */
@property (nonatomic,assign) BOOL isShowRedDot;


@end
