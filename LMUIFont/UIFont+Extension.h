//
//  UIFont+Extension.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

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



@interface UIFont (Extension)

@end
