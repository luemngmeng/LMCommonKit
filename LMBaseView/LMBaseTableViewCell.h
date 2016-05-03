//
//  LMBaseTableViewCell.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/26/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBaseTableViewCell : UITableViewCell

/**
 *  是否开启高亮
 */
@property (nonatomic, assign) BOOL highlightEnable;


/**
 *  设置cell选中的背景色
 */
- (void)setupSelectedBackgroundColor;


/**
 *  根据model内容配置view的显示信息
 *
 *  @param model 模型数据
 */
- (void)setupViewWithModel:(id)model;


@end
