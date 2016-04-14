//
//  LMWaxPatchManager.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/12/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMWaxPatchManager : NSObject


/**
 *  启动Wax
 */
+ (void)start;


/**
 *  执行Lua语句
 */
+ (void)runLuaString:(NSString *)luaString;


/**
 *  加载Lua文件
 *
 *  @param luaFileName Lua文件名称
 */
+ (void)runLuaFile:(NSString *)luaFileName;


/**
 *  更新补丁文件
 */
+ (void)updatePatchFiles;


/**
 *  清除补丁缓存
 */
+ (void)cleanPatchCache;

@end
