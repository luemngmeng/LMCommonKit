//
//  LMPageModel.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/27/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMPageModel : NSObject

/**
 *  当前页面编号
 */
@property (assign, nonatomic) NSInteger pageNum;


/**
 *  页面总数
 */
@property (assign, nonatomic) NSInteger totalPage;


/**
 *  一页显示的条数
 */
@property (assign, nonatomic) NSInteger pageSize;


@end
