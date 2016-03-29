//
//  UIColor+Extension.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  宏定义RGB的颜色 （颜色为0-255之间）
 *
 *  @param r
 *  @param g
 *  @param b
 *
 *  @return UIColor类型
 */
#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]


/**
 *  宏定义RGBA的颜色 （颜色为0-255之间）
 *
 *  @param r
 *  @param g
 *  @param b
 *  @param a
 *
 *  @return UIColor类型
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]


/**
 *  RGB色值转化为UIColor
 *
 *  @param rgbValue
 *
 *  @return UIColor类型
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 16))/255.0 green:((float)((rgbValue & 0xFF0000) >> 8))/255.0 blue:((float)(rgbValue & 0xFF00))/255.0 alpha:((float)(rgbValue & 0xFF))/255.0]


@interface UIColor (Extension)



/**
 *  将16进制色值代码转换为UIColor对象
 *
 *  @param hexString 16进制色值，如"#DCDCDC"
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorFromHexCode:(NSString *)hexString;

/*****************青绿色**************/
/**
 *  青绿色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)turquoiseColor;


/**
 *  青绿色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)greenSeaColor;


/*****************淡绿色**************/
/**
 *  淡绿色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)emerlandColor;


/**
 *  淡绿色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)nephritisColor;


/*****************淡蓝色**************/
/**
 *  淡蓝色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)peterRiverColor;


/**
 *  淡蓝色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)belizeHoleColor;


/*****************淡紫色**************/
/**
 *  淡紫色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)amethystColor;


/**
 *  淡紫色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)wisteriaColor;


/*****************淡黑色**************/
/**
 *  淡黑色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)wetAsphaltColor;


/**
 *  淡黑色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)midnightBlueColor;


/*****************淡黄色**************/
/**
 *  淡黄色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)sunflowerColor;


/**
 *  淡黄色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)tangerineColor;


/*****************橙色**************/
/**
 *  橙色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)carrotColor;


/**
 *  橙色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)pumpkinColor;


/*****************淡红色**************/
/**
 *  淡红色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)alizarinColor;


/**
 *  淡红色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)pomegranateColor;


/*****************白色**************/
/**
 *  白色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)cloudsColor;


/**
 *  白色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)silverColor;


/*****************青灰色**************/
/**
 *  青灰色normal
 *
 *  @return UIColor对象
 */
+ (UIColor *)concreteColor;


/**
 *  青灰色highlight
 *
 *  @return UIColor对象
 */
+ (UIColor *)asbestosColor;


/*****************白烟色**************/
/**
 *  白烟色
 *
 *  @return UIColor对象
 */
+ (UIColor *)whiteSmokeColor;


/**
 *  淡灰色
 *
 *  @return UIColor对象
 */
+ (UIColor *)gainsboroColor;


/**
 *  金额的默认颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)amountColor;


/**
 *  利率的默认颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)rateColor;


/**
 *  默认灰色字体颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)textGrayColor;


/**
 *  深灰色字体颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)textDarkGrayColor;


/**
 *  导航条默认背景颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)navigationBarBackgroundColor;


/**
 *  确认按钮普通状态下的背景色
 *
 *  @return UIColor对象
 */
+ (UIColor *)confirmButtonNormalColor;


/**
 *  确认按钮高亮状态下的背景色
 *
 *  @return UIColor对象
 */
+ (UIColor *)confirmButtonHighlightedColor;


/**
 *  确认按钮失效状态下的背景色
 *
 *  @return UIColor对象
 */
+ (UIColor *)confirmButtonDisabledColor;


/**
 *  发送验证码按钮普通状态下的背景色
 *
 *  @return UIColor对象
 */
+ (UIColor *)verificationCodeButtonNormalColor;


/**
 *  发送验证码按钮高亮状态下的背景色
 *
 *  @return UIColor对象
 */
+ (UIColor *)verificationCodeButtonHighlightedColor;


/**
 *  界面默认背景颜色
 *
 *  @return UIColor对象
 */
+ (UIColor *)viewBackgroundColor;



@end
