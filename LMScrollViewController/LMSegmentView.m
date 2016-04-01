//
//  LMSegmentView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/30/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//
#import "Masonry.h"
#import "LMSegmentView.h"
#import "UIFont+Extension.h"

@interface LMSegmentView ()

/**
 *  contentTitle对应的item
 */
@property (nonatomic,strong) LMSegmentItem *segmentItem;

@end

@implementation LMSegmentView

#pragma mark - lifeCycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // 配置视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 配置视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // 配置视图
        [self initContentView];
    }
    
    return self;
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    // 配置视图
    [self initContentView];
}


#pragma mark 自定义初始化方法
- (instancetype)initWithFrame:(CGRect)frame segmentItem:(LMSegmentItem *)segmentItem {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.segmentItem = segmentItem;
        [self initContentView];
    }
    
    return self;
}


#pragma mark - Private Method
#pragma mark 配置视图
- (void)initContentView {
    
    self.userInteractionEnabled = YES;
    // 添加content Button
    [self addSubview:self.contentButton];
    [self.contentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
}


#pragma mark contentButton
- (UIButton *)contentButton {
    
    if (!_contentButton) {
        _contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_contentButton addTarget:self action:@selector(contentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 配置contentButton
        if (self.segmentItem) {
            [self.contentButton setTitle:self.segmentItem.title forState:UIControlStateNormal];
            [self.contentButton setTitleColor:self.segmentItem.normalTitleColor forState:UIControlStateNormal];
            [self.contentButton setTitleColor:self.segmentItem.selectTitleColor forState:UIControlStateSelected];
            [self.contentButton setTitleColor:self.segmentItem.selectTitleColor forState:UIControlStateHighlighted];
            [self.contentButton.titleLabel setFont:THSystemFont([self.segmentItem.normalTextFont intValue])];
        }
    }
    
    return _contentButton;
}


#pragma mark contentButton的点击方法
- (void)contentButtonClick:(UIButton *)sender {
    NSLog(@"点击了button");
}


#pragma mark - Public Method

@end
