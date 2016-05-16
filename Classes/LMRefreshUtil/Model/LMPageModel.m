//
//  LMPageModel.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMPageModel.h"

@implementation LMPageModel

#pragma mark - Lifecycle
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self defaultDateInfo];
    }
    
    return self;
}


#pragma mark 默认数据(pageNum是1 totalPage是 0 pageSize是 10)
- (void)defaultDateInfo {
    
    self.pageNum = 1;
    self.totalPage = 20;
    self.pageSize = 10;
    
}

@end
