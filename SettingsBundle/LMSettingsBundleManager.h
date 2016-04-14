//
//  LMSettingsBundleManager.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/12/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

// 泰和网的偏好设置
#define SERVER_ENVIRONMENT_PREFERENCE @"server_environment_preference"
#define CUSTOM_SERVER_ENVIRONMENT_PREFERENCE @"custom_server_environment_name"

#import <Foundation/Foundation.h>

@interface LMSettingsBundleManager : NSObject


/**
 *  存储app的偏好设置信息
 */
- (void)readingTaiheAppPreference;


/**
 *  获取偏好设置的值
 */
- (NSInteger )getEnvironmentType;

@end
