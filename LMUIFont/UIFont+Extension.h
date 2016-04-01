//
//  UIFont+Extension.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMCommonkitHeader.h"

/**
 *  系统默认字体 宋体
 *
 *  @param fontSize 字体大小
 *
 *  @return 字体大小
 */
#define SystemFontOfSize(fontSize)             [UIFont fontWithName:@"Helvetica" size:(fontSize)]


/**
 *  系统粗体字体 宋体
 *
 *  @param fontSize 字体大小
 *
 *  @return 字体大小
 */
#define SystemBoldFontOfSize(fontSize)         [UIFont fontWithName:@"Helvetica-Bold" size:(fontSize)]


/**
 *  字体基于苹果4字体比例
 *
 *  @param x
 *
 *  @return 适配后的字体大小
 */
#define THSystemFont(x) [UIFont systemFontOfSize:floor(x * DEVICE_SCREEN_WIDTH_SCALE)]


/**
 *  字体基于苹果6的字体比例
 *
 *  @param x 字体大小
 *
 *  @return 适配后的字体大小
 */
#define THSystemFont_6(x) [UIFont systemFontOfSize:floor(x * DEVICE_SCREEN_WIDTH_SCALE_6)]



@interface UIFont (Extension)

@end
