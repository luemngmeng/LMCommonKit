//
//  LMBaseView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseView.h"

@implementation LMBaseView

#pragma mark - Public Method
#pragma mark - 从nib文件中获取view
+ (instancetype)initViewFromNibFile {
    return [self initViewWithNibName:NSStringFromClass([self class])];
}


#pragma mark - 根据nibName从nib文件中获取view
+ (instancetype)initViewWithNibName:(NSString *)nibName {
    return [self initViewWithNibName:nibName currentNibIndex:0];
}


#pragma mark - 根据nibName从nib文件中获取当前索引的view
+ (instancetype)initViewWithNibName:(NSString *)nibName currentNibIndex:(NSInteger)currentNibIndex  {
    
    if (!nibName) {
        return nil;
    }
    
    
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    if ([nibArray count] <= currentNibIndex || nibArray.count <= 0) {
        return nil;
    }
    
    
    id nibView = [nibArray objectAtIndex:currentNibIndex];
    if (!nibView) {
        return nil;
    }
    
    return nibView;
    
}

#pragma mark - 根据model内容配置view的显示信息 （子类可重写这个方法）
- (void)setupViewWithModel:(id)model {
    
}

@end
