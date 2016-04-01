//
//  LMSegmentScrollView.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseScrollView.h"
#import "LMSegmentItem.h"

@interface LMSegmentScrollView : LMBaseScrollView


/**
 *  自定义初始化SegmentScrollView的方法
 *
 *  @param frame
 *  @param itemArray
 *
 *  @return 
 */
- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray *)itemArray ;

@end
