//
//  LMBaseTableViewCell.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/26/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseTableViewCell.h"
#import "UIColor+Extension.h"

@implementation LMBaseTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib {
    
    self.highlightEnable = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self setupSelectedBackgroundColor];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setupSelectedBackgroundColor];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupSelectedBackgroundColor];
    }
    
    return self;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupSelectedBackgroundColor];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (!self.highlightEnable) {
        
        return;
    }
    
    
    if (!highlighted) {
        
        self.backgroundColor = [UIColor whiteColor];
        
    } else {
        
        self.backgroundColor = UIColorFromRGB(0xF8F8F8);
    }
}



#pragma mark - Public Methods
#pragma mark 设置cell选中的背景色
- (void)setupSelectedBackgroundColor {
    
    UIView *selectedBackgroundView = [UIView new];
    selectedBackgroundView.backgroundColor = UIColorFromRGB(0xF8F8F8);
    self.selectedBackgroundView = selectedBackgroundView;
    
}


#pragma mark 根据model内容配置view的显示信息
- (void)setupViewWithModel:(id)model {
    
}
@end
