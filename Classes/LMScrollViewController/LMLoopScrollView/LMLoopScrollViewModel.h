//
//  LMLoopScrollViewModel.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseDateSourceModel.h"

@interface LMLoopScrollViewModel : LMBaseDateSourceModel


/**
 *  广告id    ID
 *
 */
@property (nonatomic, strong) NSString *ID;

/**
 *  标题  TITLE
 */
@property (nonatomic, strong) NSString *title;

/**
 *  图片地址 ICONURL
 */
@property (nonatomic, strong) NSString *imageUrl;

/**
 *  图片跳转地址 URL
 */
@property (nonatomic, strong) NSString *jumpUrl;


@end
