//
//  LMBadgeView.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/5/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  显示带有红点及消息标注的视图

#import "LMBadgeView.h"
#import "Masonry.h"
#import "UIFont+Extension.h"

@interface LMBadgeView ()

@end

@implementation LMBadgeView


#pragma mark lifeCycle
#pragma mark 默认的红点（不带标注）
- (instancetype)initWithFrame:(CGRect)frame isShowDefaultRedDot:(BOOL)isShowDefaultRedDot {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 显示默认的小红点
        if (isShowDefaultRedDot) {
            [self initContentView];
        }
    }
    
    return self;
}


#pragma mark 带标注的红点
- (instancetype)initWithFrame:(CGRect)frame isShowMessageTagRedDot:(BOOL)isShowMessageTagRedDot messageTagValue:(NSString *)messageTagValue {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 显示带有标注的小红点
        if (isShowMessageTagRedDot) {
            
            [self initContentView];
            
            self.badgelabel.hidden = NO;
            self.badgelabel.text = messageTagValue;
        }
    }
    
    return self;
}


#pragma mark 添加默认的红点
- (void)initContentView{
   
    self.backgroundColor = [UIColor colorWithRed:242.0/255 green:90.0/255 blue:43.0/255 alpha:1];
    
    // 添加红点的Label
    CGFloat badgeLabelWidth = self.frame.size.width - 5;
    CGFloat badgeLabelHeight = self.frame.size.height - 5;
    [self addSubview:self.badgelabel];
    [self.badgelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(badgeLabelWidth));
        make.height.equalTo(@(badgeLabelHeight));
    }];
}


#pragma mark 红点的label
- (UILabel *)badgelabel {
    
    if (!_badgelabel) {
        _badgelabel = [[UILabel alloc] init];
        _badgelabel.textColor = [UIColor whiteColor];
        _badgelabel.textAlignment = NSTextAlignmentCenter;
        _badgelabel.hidden = YES;
        _badgelabel.font = THSystemFont(9);
    }
    
    return _badgelabel;
}


@end
