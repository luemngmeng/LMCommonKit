//
//  LMBaseDateSourceModel.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMBaseDateSourceModel : NSObject


/**
 *  根据数据字典生成model
 *
 *  @param instancetype 字典数据
 *
 *  @return model
 */
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dictionary;


/**
 *  根据数据字典生成model
 *
 *  @param instancetype 数组数据
 *  @param instancetype 类
 *
 *  @return 带有model的数组
 */
+ (NSArray *)parseSubItemList:(NSArray *)oriItemList withClass:(Class)cls ;


/**
 *  使用dict的key进行解析数据并赋值
 *
 *  @param dictionary 
 */
- (void)parseWithDictionaryKeys:(NSDictionary *)dictionary ;

@end
