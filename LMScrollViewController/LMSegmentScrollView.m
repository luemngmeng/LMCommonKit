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
        
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    
    return self;
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}



#pragma mark - Public Method
#pragma mark 配置scrollView及子视图（重写父视图的方法）
- (void)setupScrollView {
    
    
    // 配置scrollView视图
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    
    
    
}

@end
