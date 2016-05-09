//
//  LMRefreshDateSourceNetworkErrorView.m
//  LMCommonKit
//
//  Created by mengmenglu on 5/3/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  刷新数据时，网络出错

#import "LMRefreshDateSourceNetworkErrorView.h"

#import "LMCommonkitHeader.h"
#import "UIColor+Extension.h"
#import "Masonry.h"

@interface LMRefreshDateSourceNetworkErrorView ()

/**
 *  加载失败的图片
 */
@property(nonatomic,strong) UIImageView  *loadFailureImageView;

/**
 *  加载失败的文字Label
 */
@property(nonatomic,strong) UILabel *loadFailureLabel;


/**
 *  点击屏幕重新加载的Label
 */
@property(nonatomic,strong)UILabel *reloadLabel;


@end

@implementation LMRefreshDateSourceNetworkErrorView


#pragma mark - lifeCyle

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xF4F4F4);
        
        // 配置子视图
        [self setupSubView];
        
        // 添加点击手势，重新加载
        UITapGestureRecognizer *reloadTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reloadTapClickWithNetwotkError:)];
        [self addGestureRecognizer:reloadTap];
        
    }
    
    return self;
}


#pragma mark - Private Method
#pragma 配置子视图
- (void)setupSubView {
    
    
    // 加载失败图片视图
    self.loadFailureImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.loadFailureImageView.image= [UIImage imageNamed:@"load_fail"];
    [self addSubview:self.loadFailureImageView ];
    [self.loadFailureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(-80 * DEVICE_SCREEN_WIDTH_SCALE);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
        
    }];
    
    
    
    // 加载失败label
    self.loadFailureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,125,200,30)];
    self.loadFailureLabel.textAlignment = NSTextAlignmentCenter;
    self.loadFailureLabel.text = @"网络无法连接";
    self.loadFailureLabel.font = [UIFont systemFontOfSize:14];
    self.loadFailureLabel.textColor =[UIColor colorWithRed:201.0/255.0f green:201.0/255.0f blue:201.0/255.0f alpha:1.0];
    [self addSubview:self.loadFailureLabel];
    [self.loadFailureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.loadFailureImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(@200);
        make.height.mas_equalTo(@20);
        
    }];
    
    
    
    // 点击屏幕，重新加载label
    self.reloadLabel= [[UILabel alloc] initWithFrame:CGRectMake(0,150,200,20)];
    self.reloadLabel.textAlignment = NSTextAlignmentCenter;
    self.reloadLabel.text = @"点击屏幕刷新";
    self.reloadLabel.font = [UIFont systemFontOfSize:12];
    self.reloadLabel.textColor =[UIColor colorWithRed:201.0/255.0f green:201.0/255.0f blue:201.0/255.0f alpha:1.0];
    [self addSubview:self.reloadLabel];
    [self.reloadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.reloadLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(@200);
        make.height.mas_equalTo(@20);
        
    }];
    
}


#pragma mark - Public Method
- (void)reloadTapClickWithNetwotkError:(UITapGestureRecognizer *)tap {
    
    // 开始回调，重新加载
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadViewPressedWithNetworkFailure)]) {
        [self.delegate reloadViewPressedWithNetworkFailure];
    }
}




@end
