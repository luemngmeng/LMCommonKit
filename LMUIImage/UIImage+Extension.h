//
//  UIImage+Extension.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据UIColor生成UIImage
 *
 *  @param color 生成图片的颜色
 *
 *  @return 生成的UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *  根据UIColor生成指定大小的UIImage
 *
 *  @param color 生成图片的颜色
 *  @param size  指定的大小
 *
 *  @return 生成的UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  根据UIColor和cornerRadius生成圆角的UIImage
 *
 *  @param color 生成图片的颜色
 *  @param cornerRadius 圆角的半径
 *  @return 生成的UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;


/**
 *  生成返回按钮图片
 *
 *  @param color        按钮颜色
 *  @param metrics      尺寸类型
 *  @param cornerRadius 圆角度数
 *
 *  @return 生成的UIImage对象
 */
+ (UIImage *)backButtonImageWithColor:(UIColor *)color barMetrics:(UIBarMetrics)metrics cornerRadius:(CGFloat)cornerRadius;


/**
 *  获取屏幕截图
 *
 *  @return 屏幕截图
 */
+ (UIImage *)screenshots;


/**
 *  生成毛玻璃效果的图片
 *
 *  @return 生成的UIImage对象
 */
- (UIImage *)imageWithBlur;


/**
 *  生成自定义毛玻璃效果的图片
 *
 *  @param alpha                 透明度 0~1，0为白，1为深灰色
 *  @param radius                半径:默认30, 推荐值 3  半径值越大越模糊, 值越小越清楚
 *  @param colorSaturationFactor 色彩饱和度(浓度)因子：0是黑白灰，9是浓彩色，1是原色 默认1.8； “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 *
 *  @return 生成的UIImage对象
 */
- (UIImage *)imageWithalpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor;



/**
 *  根据maxImagePix设定的图片最大显示像素压缩图片
 *
 *  @param maxImagePix 最大图片像素
 *
 *  @return 压缩生成的UIImage对象
 */
- (UIImage *)compressedImage:(float)maxImagePix;


/**
 *  根据compressionQuality缩放比率压缩图片并返回NSData数据
 *
 *  @param compressionQuality 缩放比率
 *
 *  @return 压缩生成的UIImage对象
 */
- (NSData *)compressedData:(CGFloat)compressionQuality;

@end
