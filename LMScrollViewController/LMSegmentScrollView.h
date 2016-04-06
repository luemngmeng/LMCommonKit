//
//  LMSegmentScrollView.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseScrollView.h"
#import "LMSegmentItem.h"
#import "LMSegmentView.h"

#import "Masonry.h"
#import "UIFont+Extension.h"

#define  SEGMENT_VIEW_TAG   10087
#define  CONTENT_BUTTON_TAG   11087
#define  CONTENT_BUTTON_TEXT_FONT  @"14"
#define  SEGMENTVIEW_WIDTH  (CGFloat)self.frame.size.width / 4

@interface LMSegmentScrollView : LMBaseScrollView


/**
 *  存储的各个内容的数据
 */
@property (nonatomic,strong) NSArray *itemArray;


/**
 *  自定义初始化SegmentScrollView的方法(默认只有title,不带红点和指示线条)
 *
 *  @param frame
 *  @param itemArray
 *
 *  @return 
 */
- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray *)itemArray ;


/**
 *  设置子视图
 */
- (void)setupScrollView;


/**
 *  contentButton实现的点击事件
 *
 *  @param button 当前选中的contentButton
 */
- (void)contentButtonClick:(UIButton *)button;

@end
