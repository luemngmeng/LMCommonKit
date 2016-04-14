//
//  LMSettingsBundleManager.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/12/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
/**
 *   在Root.plist设置偏好设置（以iqiyi.plist和cmb.plist为例子）
 */

#import "LMSettingsBundleManager.h"

@implementation LMSettingsBundleManager

#pragma mark 存储app的偏好设置信息
- (void)readingTaiheAppPreference {
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle) {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    if (!settings) { // 找不到资源文件
        return;
    }
    
    
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    
    for(NSDictionary *prefSpecification in preferences) {
        
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key) {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
        }
        
    }
    
    
    NSLog(@"defaultsToRegister = %@",defaultsToRegister);
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark 获取偏好设置的值
- (NSInteger )getEnvironmentType {
    
    /**
     *   至于里面的规则怎么定义，需要根据不同的项目来定
     */
    

    NSString *defaultValue = 0;
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *serverPrefecenseValue = [defaults objectForKey:SERVER_ENVIRONMENT_PREFERENCE];
    NSString *customServerPrefecenseValue = [defaults objectForKey:CUSTOM_SERVER_ENVIRONMENT_PREFERENCE];
    

    if (![THUserDefaultsManager guideFinshed]) { // 判断程序是不是第一次运行
        serverPrefecenseValue = @"0";
    } else {
        
        // 获取环境配置
        if (customServerPrefecenseValue.length == 0) { // 判断是否有自定义服务器环境
            
            if (!serverPrefecenseValue) {  // 判断服务器选择是否有值
                return 0;  // 默认读取生产环境
            } else {
                defaultValue = serverPrefecenseValue;
            }
            
        } else {  // 自定义服务器
            
            if ([customServerPrefecenseValue hasPrefix:@"http"]) {
                defaultValue = customServerPrefecenseValue;
            } else {
                return 0;  // 默认读取生产环境
            }
        }
    }
    */
    
    NSLog(@"defaultValue ======= %@",defaultValue);
    return [defaultValue intValue];
}


@end
