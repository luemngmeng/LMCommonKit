//
//  LMResponder.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/14/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMResponder : UIResponder

/**
 *  App中最底层的UIWindow，弹出框、加载框等模态对话框都会用到
 */
@property (nonatomic, strong) UIWindow *window;


/**
 *  项目使用的主界面控制器（navigationController、tabBarController或viewController）
 */
@property (nonatomic, strong) UIViewController *rootViewController;


/**
 *  实现界面侧滑功能的视图控制器
 */
@property (nonatomic, strong) id drawerController;


/**
 *  项目默认使用的控制器
 */
@property (nonatomic, strong) UIViewController *defaultViewController;


/**
 *  获取应用程序实例，单例模式
 *
 *  @return 应用程序实例对象
 */
+ (LMResponder *)sharedResponder;



@end
