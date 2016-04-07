//
//  LMSegmentView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/30/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
/*
 *  1、默认小红点的宽度和高度为7(对不同屏幕做过适配)
 *  2、对于是带有消息标注的红点需根据内容动态获取宽高
 *  3、默认显示横线指示条（蓝色）
 */

#import "Masonry.h"
#import "LMSegmentView.h"
#import "LMBadgeView.h"

#import "LMStringUtil.h"
#import "UIFont+Extension.h"

#define REDDOT_WIDTH  6*DEVICE_SCREEN_WIDTH_SCALE
#define REDDOT_HEIGHT   6*DEVICE_SCREEN_WIDTH_SCALE

@interface LMSegmentView ()

/**
 *  contentTitle对应的item
 */
@property (nonatomic,strong) LMSegmentItem *segmentItem;


/**
 *  小红点视图
 */
@property (nonatomic,strong) LMBadgeView *badgeView;


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


#pragma mark 自定义初始化方法(不带红点或者是消息标注)
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
    
    
    // 默认添加红点（但是不显示消息标注,默认隐藏）
    if (![LMStringUtil isEmptyStringWith:self.segmentItem.title]) {
        
        CGSize contentButtonTitleSize = [LMStringUtil calculateTextSizeWithText:self.segmentItem.title TextFont:TEXT_FONT constrainedToSize:self.frame.size lineBreakMode:NSLineBreakByWordWrapping textAlignment:self.contentButton.titleLabel.textAlignment];
        CGFloat contentButtonTitleWidth = contentButtonTitleSize.width;
        CGFloat contentButtonTitleHeight = contentButtonTitleSize.height;
        
        CGFloat badgeViewOriginX = self.frame.size.width/ 2.0f + contentButtonTitleWidth / 2.0f + 3;
        CGFloat badgeViewOriginY = (self.frame.size.height - contentButtonTitleHeight)/2.0f;
        
        // 添加小红点
        _badgeView = [[LMBadgeView alloc] initWithFrame:CGRectMake(badgeViewOriginX, badgeViewOriginY, REDDOT_WIDTH, REDDOT_HEIGHT) isShowDefaultRedDot:YES];
        _badgeView.layer.cornerRadius = _badgeView.frame.size.height/2.0f;
        _badgeView.layer.masksToBounds = YES;
        _badgeView.hidden = YES;
        [self addSubview:_badgeView];
    }
    
}


#pragma mark contentButton
- (UIButton *)contentButton {
    
    if (!_contentButton) {
        
        _contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 配置contentButton
        if (self.segmentItem) {
            [self.contentButton setTitle:self.segmentItem.title forState:UIControlStateNormal];
            [self.contentButton setTitleColor:self.segmentItem.normalTitleColor forState:UIControlStateNormal];
            [self.contentButton setTitleColor:self.segmentItem.selectTitleColor forState:UIControlStateSelected];
            [self.contentButton setTitleColor:self.segmentItem.selectTitleColor forState:UIControlStateHighlighted];
            [self.contentButton.titleLabel setFont:TEXT_FONT];
        }
    }
    
    return _contentButton;
}



#pragma mark - Public Method
#pragma mark 是否显示红点
- (void)setIsShowRedDot:(BOOL)isShowRedDot {
    
    if (isShowRedDot) { // 显示
        self.badgeView.hidden = NO;
    } else {  // 隐藏
        self.badgeView.hidden = YES;
    }
}


@end
