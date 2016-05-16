//
//  LMLoadMore.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMLoadMoreView.h"

@interface LMLoadMoreView ()


/**
 *  显示加载状态的标签
 */
@property (nonatomic, weak) IBOutlet UILabel * statusLabel;

/**
 *  正在加载时显示的小菊花
 */
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView * activityIndicatorView;


@end

@implementation LMLoadMoreView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.activityIndicatorView.transform = CGAffineTransformMakeScale(0.75, 0.75);
    
}

@end
