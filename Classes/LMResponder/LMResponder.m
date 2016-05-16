//
//  LMResponder.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/14/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMResponder.h"

@implementation LMResponder


/**
 *  获取应用程序实例，单例模式
 *
 *  @return 应用程序实例对象
 */
+ (LMResponder *)sharedResponder
{
    return (LMResponder *)[UIApplication sharedApplication].delegate;
}

@end
