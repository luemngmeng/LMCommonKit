//
//  LMWaxPatchManager.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/12/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//


#import "LMWaxPatchManager.h"
#import "LMWaxPatchManagerKit.h"

#if TaiHeWaxPathEnable

#import "wax.h"
#import "AFNetworking.h"
#import "ZipArchive.h"

#endif

@implementation LMWaxPatchManager


#pragma mark - Class Methods
#pragma mark 启动Wax
+ (void)start {
    
#if TaiHeWaxPathEnable
    
    wax_start(nil, nil);
    
#endif
}


#pragma mark 执行Lua语句
+ (void)runLuaString:(NSString *)luaString {
    
#if TaiHeWaxPathEnable
    
    wax_runLuaString(luaString.UTF8String);
    
#endif
}


#pragma mark 加载Lua文件
+ (void)runLuaFile:(NSString *)luaFileName {
    
#if TaiHeWaxPathEnable
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *unzipPath = [documentDirectory stringByAppendingPathComponent:@"lua"];
    NSString *luaFilePath = [unzipPath stringByAppendingFormat:@"/%@", luaFileName];
    
    NSLog(@"%@", luaFilePath);
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:luaFilePath]) {
        
        int i = wax_runLuaFile(luaFilePath.UTF8String);
        
        if (i) {
            
            NSLog(@"运行 %@ 失败\n%s", luaFileName, lua_tostring(wax_currentLuaState(), -1));
            
        } else {
            
            NSLog(@"运行 %@ 成功", luaFileName);
        }
        
    } else {
        
        NSLog(@"%@ 文件不存在", luaFileName);
    }
    
#endif
}


#pragma mark 更新补丁文件
+ (void)updatePatchFiles {
    
#if TaiHeWaxPathEnable
    
    [LMWaxPatchManager cleanPatchCache];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?t=%f", TEST_WAX_PATCH_URL, [NSDate timeIntervalSinceReferenceDate]]];
    NSLog(@"补丁下载地址: %@", [URL absoluteString]);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *zipPath = [documentDirectory stringByAppendingPathComponent:@"patch.zip"];
        NSString *unzipPath = [documentDirectory stringByAppendingPathComponent:@"lua"];
        
        if (error) {
            
            NSLog(@"补丁下载失败 %@", error);
            
        } else {
            
            NSLog(@"文件下载成功: %@", [filePath absoluteString]);
            
            // 解压文件
            BOOL success = [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipPath];
            
            if (success) {
                NSLog(@"补丁解压成功");
            }
        }
        
    }];
    
    [downloadTask resume];
    
#endif
}


#pragma mark 清除补丁缓存
+ (void)cleanPatchCache {
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *zipPath = [documentDirectory stringByAppendingPathComponent:@"patch.zip"];
    NSString *unzipPath = [documentDirectory stringByAppendingPathComponent:@"lua"];
    [[NSFileManager defaultManager] removeItemAtPath:zipPath error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:unzipPath error:nil];
}



@end
