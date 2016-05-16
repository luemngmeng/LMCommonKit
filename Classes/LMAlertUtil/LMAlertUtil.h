//
//  LMAlertUtil.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/14/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  这种弹出信息的类只针对于alert_info.plist文件

#import <Foundation/Foundation.h>
#define AlertDescription @"description"
#define AlertTitle       @"title"
#define AlertContent     @"content"


/*
 *  完成的block回调
 */
typedef void (^CompletionBlock)(NSInteger tag, NSInteger buttonIndex);


@interface LMAlertUtil : NSObject



/**
 *  根据keyName从alert_info.plist中获取提示框信息并弹出提示框
 *
 *  @param keyName  键名（alert_info.plist文件中对应的键名）
 *  @param delegate 回调对象
 *  @param tag      标签
 */
+ (void)alertViewWithKeyName:(NSString *)keyName delegate:(id)delegate tag:(NSInteger)tag;



/**
 *  根据keyName从alert_info.plist中获取提示框信息并弹出提示框,并带有block回调
 *
 *  @param keyName         键名（alert_info.plist文件中对应的键名）
 *  @param completionBlock block回调对象
 *  @param tag             标签
 */
+ (void)alertViewWithKeyName:(NSString *)keyName completionBlock:(CompletionBlock)completionBlock tag:(NSInteger)tag;



/**
 *  根据标题和消息的内容弹出提示框
 *
 *  @param title    标题
 *  @param message  内容
 *  @param delegate 回调对象
 *  @param tag      标签
 */
+ (void)alertViewWithTitle:(NSString*)title message:(NSString *)message delegate:(id)delegate tag:(NSInteger)tag;



/**
 *  从plist中获取alert的提示信息dictionary
 *
 *  @param key plist生成dictionary的key
 *
 *  @return key所关联的value
 */
+ (NSDictionary *)queryAlertInfo:(NSString *)key;



/**
 *  从plist中获取alert的提示的alertContent信息
 *
 *  @param key plist生成dictionary的key
 *
 *  @return key所关联的value
 */
+ (NSString *)alertContentFromKey:(NSString *)key;



/**
 *  从plist中获取alert的提示的alertContent信息,弹出提示框对应的信息
 *
 *  @param key plist生成dictionary的key
 */
+ (void)toastFromKey:(NSString *)key;

@end
