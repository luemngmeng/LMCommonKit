//
//  LMStringUtil.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/25/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
/**
 *  1、判断字符串是否为空
 *  2、判断是否是手机号码
 *  3、判断是否是电话号码
 *  4、判断是否是验证码
 *  5、判断是否是身份证号
 ****************************
 *  6、浮点型数据四舍五入
 *  7、格式化所有带标签的文本（将html格式转化为string类型的）
 *  8、判断字符串内容是否为整形
 *  9、判断字符串内容是否为浮点形
 *  10、去除字符串中的空格
 *  11、对手机号码做特殊隐藏处理（例如158********）
 *  12、正则表达式验证
 *
 */

#import "LMInputLimit.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LMStringUtil : NSObject


/**
 *  判断字符串是否为空
 *
 *  @param string 判断的字符串
 *
 *  @return 判断结果
 */
+ (BOOL)isEmptyStringWith:(NSString *)string;



/**
 *  判断字符串是否是手机号码
 *
 *  @param mobileNumber 判断的字符串
 *
 *  @return 判断结果
 */
+ (BOOL)checkMobileNumberWith:(NSString *)mobileNumber;



/**
 *  判断字符串是否是电话号码
 *
 *  @param telephoneNumber 判断的字符串
 *
 *  @return 判断结果
 */
+ (BOOL)checkTelephoneNumberWith:(NSString *)telephoneNumber;



/**
 *  判断是否是验证码
 *
 *  @param astr 验证码字符串
 *
 *  @return
 */
+ (BOOL)checkVerificationCodeWith:(NSString *)astr;




/**
 *  判断是否是身份证号
 *
 *  @param IDCard 身份证号字符串
 *
 *  @return
 */
+ (BOOL)isValidateIDCard:(NSString *)IDCard;



/**
 *  判断字符串内容是否为整形
 *
 *  @return 判断结果
 */
+ (BOOL)isPureIntWith:(NSString *)intString;



/**
 *  判断字符串内容是否为浮点形
 *
 *  @return 判断结果
 */
+ (BOOL)isPureFloatWith:(NSString *)floatString;



/**
 *  浮点型数据四舍五入
 *
 *  @param format 保留两位小数  传入@"0.00";
 *  @param floatV 字符数据
 *
 *  @return 四舍五入保留两位后的字符串
 */
+(NSString *)decimalwithFormat:(NSString *)format  floatV:(float)floatV;



/**
 *  向前进1取整（只针对于精确度为两位的浮点数）
 *
 *  @param floatNumber
 *
 *  @return
 */
+ (NSString *)roundingWithFloatingNumber:(float)floatNumber;



/**
 *  格式化所有带标签的文本
 *
 *  @param html 带标签的字符串
 *
 *  @return 处理完成后不带标签的字符串
 */
+(NSString *)stringFromfilterHTML:(NSString *)html;



/**
 *  查看字符串中是否包含字符串
 *
 *  @param html 传入的字符串
 *
 *  @return 是否包含
 */
+ (BOOL)isContainString:(NSString *)aString withSuperString:(NSString *)superString;



/**
 *  去除字符串中的空格
 *
 *  @param html 传入的字符串
 */
+ (NSString *)removeSpacesFromString:(NSString *)superString;



/**
 *  对手机号码做特殊处理（例如158********）
 *
 *  @param html 传入的电话号码字符串
 */
+ (NSString *)specialTreatmentPhoneNumberWith:(NSString *)numberString;



/**
 *  正则表达式验证
 *
 *  @param regex 正则表达式的验证格式
 *
 *  @param string 验证的字符串
 *
 *  @return true or false
 */
+ (BOOL)checkValidWithRegex:(NSString *)regex string:(NSString *)string;



/**
 *  计算文本的大小
 *
 *  @param textFont           文本的Font
 *  @param constrainedMaxSize 能计算的最大尺寸
 *
 *  @return 改文本的大小CGSize
 */
+ (CGSize)calculateTextSizeWithText:(NSString *)stretxt TextFont:(UIFont *)textFont constrainedToSize:(CGSize)constrainedMaxSize lineBreakMode:(NSLineBreakMode)lineBreakMode textAlignment:(NSTextAlignment)textAlignment;



@end
