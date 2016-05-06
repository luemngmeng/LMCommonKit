//
//  LMRefreshDateSourceLoadingView.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//


#import "LMRefreshDateSourceLoadingView.h"

#import "UIColor+Extension.h"
#import "Masonry.h"

@interface LMRefreshDateSourceLoadingView ()


@end

@implementation LMRefreshDateSourceLoadingView

#pragma mark - LifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xF4F4F4);
        // 创建子视图
        [self createSubView];
    }
    
    return self;
}


- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xF4F4F4);
        // 创建子视图
        [self createSubView];
        
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xF4F4F4);
        // 创建子视图
        [self createSubView];
        
    }
    
    return self;
}


#pragma mark - Private Method
#pragma mark 创建子视图
- (void)createSubView {
    
    
    // 添加加载动画视图
    self.loadingImageView = [[UIImageView alloc] init];
    self.loadingImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.loadingImageView];
    [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(-50);
        make.width.mas_equalTo(@100);
        make.width.mas_equalTo(@100);
        
    }];
    
    // 配置动画视图的数据
    NSMutableArray *loadingImageArr = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        
        NSString *imagestr = [NSString stringWithFormat:@"trLoading%d",i];
        UIImage *loadImage = [UIImage imageNamed:imagestr];
        if (loadImage) {
            [loadingImageArr addObject:loadImage];
        }
    }
    
    if (loadingImageArr.count == 0) {
        return;
    }
    
    // 开始动画
    self.loadingImageView.animationImages = loadingImageArr;
    self.loadingImageView.animationDuration = 0.9f;
    [self.loadingImageView startAnimating];
    
    
    
    
    // 添加正在加载状态的label
    self.loadingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.loadingLabel.textAlignment = NSTextAlignmentCenter;
    self.loadingLabel.text = @"    努力加载中...";
    self.loadingLabel.font = [UIFont systemFontOfSize:14];
    self.loadingLabel.textColor =[UIColor colorWithRed:201.0/255.0f green:201.0/255.0f blue:201.0/255.0f alpha:1.0];
    [self addSubview:self.loadingLabel];
    [self.loadingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.loadingImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(@200);
        make.height.mas_equalTo(@30);
        
    }];
    
}


@end
