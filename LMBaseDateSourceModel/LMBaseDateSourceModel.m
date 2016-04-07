//
//  LMBaseDateSourceModel.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  基础类的数据模型

#import "LMBaseDateSourceModel.h"

@implementation LMBaseDateSourceModel


#pragma mark 根据数据字典生成model
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dictionary {
    
    LMBaseDateSourceModel * model = [[self alloc] init];
    [model parseWithDictionaryKeys:dictionary];
    return model;
}


#pragma mark 用class解析数组
+ (NSArray *)parseSubItemList:(NSArray *)oriItemList withClass:(Class)cls {
    
    if (![oriItemList isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray * itemList = [NSMutableArray array];
    [oriItemList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        id itemId = [[cls alloc] init];
        
        if (itemId && [itemId isKindOfClass:[LMBaseDateSourceModel class]]) {
            LMBaseDateSourceModel * itemModel = (LMBaseDateSourceModel*)itemId;
            [itemModel parseWithDictionaryKeys:obj];
            [itemList addObject:itemModel];
        }
    }];
    
    return itemList;
}


#pragma mark 使用dict的key进行解析数据并赋值
- (void)parseWithDictionaryKeys:(NSDictionary *)dictionary {
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    
    NSArray * keys = [dictionary allKeys];
    [keys enumerateObjectsUsingBlock:^(NSString* theKey, NSUInteger idx, BOOL *stop) {
        
        id value = [dictionary objectForKey:theKey];
        if (value && ![value isKindOfClass:[NSNull class]]) {
            [self setValue:value forKey:theKey];
        }
    }];
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"setValue:%@, forUndefinedKey:%@", value, key);
}

@end
