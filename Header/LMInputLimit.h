//
//  LMInputLimit.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/25/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#ifndef LMInputLimit_h
#define LMInputLimit_h


// ------------------------ 输入框限制长度 -----------------------

/*
 邮箱             邮箱格式必须输入正确；
 手机号码          11位数字；
 验证码            对应短信验证码，正确输入 (暂定6位)；
 */

/**
 *  邮箱最小输入长度
 */
#define INPUT_EMAIL_MIN_LENGTH   5



/**
 *  邮箱最大输入长度
 */
#define INPUT_EMAIL_MAX_LENGTH   30



/**
 *  手机号码输入长度
 */
#define INPUT_PHONE_NUMBER_LENGTH   11



/**
 *  短信验证码输入长度
 */
#define INPUT_SMS_VERIFICATION_CODE_LENGTH 6


#endif /* LMInputLimit_h */
