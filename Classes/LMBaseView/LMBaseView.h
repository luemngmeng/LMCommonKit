//
//  LMBaseView.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBaseView : UIView


/**
 * 从nib文件中获取view
 */
+ (instancetype)initViewFromNibFile;


/**
 *  根据nibName从nib文件中获取view
 */
+ (instancetype)initViewWithNibName:(NSString *)nibName;


/**
 *  根据nibName从nib文件中获取当前索引的view
 */
+ (instancetype)initViewWithNibName:(NSString *)nibName currentNibIndex:(NSInteger)currentNibIndex ;

/**
*  根据model内容配置view的显示信息
*
*  @param model 模型数据
*/
- (void)setupViewWithModel:(id)model;

@end
