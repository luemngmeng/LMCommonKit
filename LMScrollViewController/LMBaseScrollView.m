//
//  LMBaseScrollView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//
#import "LMBaseScrollView.h"

#import "Masonry.h"

@implementation LMBaseScrollView

#pragma mark - lifeCycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // 默认做的操作
        [self initContentView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 默认做的操作
        [self initContentView];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // 默认做的操作
        [self initContentView];
    }
    
    return self;
}

#pragma mark - Private Method
- (void)initContentView {
    
    /*
    // 添加默认的ScrollView视图
    self.scrollView = [[UIScrollView alloc] init];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];*/


}

#pragma mark - Public Method
#pragma mark 设置ScrollView 子类可重写这个方法来配置当前的scroolView视图
- (void)setupScrollView {
    
}

@end
