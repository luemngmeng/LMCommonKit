//
//  LMSegmentScrollView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMSegmentScrollView.h"

@implementation LMSegmentScrollView

#pragma mark - lifeCycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    // 配置scrollView视图
    [self initContentView];
}


- (void)initContentView {
    
    // 配置scrollView视图
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
}



#pragma mark - Public Method
#pragma mark 配置scrollView及子视图（重写父视图的方法）
- (void)setupScrollView {
    
    
    
}

@end
