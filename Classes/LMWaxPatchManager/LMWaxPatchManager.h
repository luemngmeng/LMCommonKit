//
//  LMWaxPatchManager.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/12/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  一般使用lua这种方法进行热修复怕苹果审核不通过，所以建议使用苹果官方支持的脚本语言JSPatch热修复

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
