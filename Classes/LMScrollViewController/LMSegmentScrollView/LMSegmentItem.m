//
//  LMSegmentItem.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/30/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMSegmentItem.h"

@implementation LMSegmentItem

- (instancetype)initWithTitle:(NSString *)title
             normalTitleColor:(UIColor *)normalTitleColor
             selectTitleColor:(UIColor *)selectTitleColor
               normalTextFont:(NSString *)normalTextFont{
    
    if (self = [super init]) {
        
        self.title = title;
        self.normalTitleColor = normalTitleColor;
        self.selectTitleColor = selectTitleColor;
        self.normalTextFont = normalTextFont;
    }
    
    return self;
}

@end
