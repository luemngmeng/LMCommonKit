//
//  LMViewControllerManager.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/22/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LMViewControllerManager : NSObject


/**
 *  当前被加载的视图控制器
 */
@property (nonatomic,weak) UIViewController *currentVC;


/**
 *  当前正在使用的navigationController
 */
@property (nonatomic,weak) UINavigationController *currentNavCtrl;


/**
 *  是否需要加载nib文件
 */
@property (nonatomic,assign) BOOL isNeedLoadNidFile;


/**
 *  单例
 *
 *  @return LMViewControllerManager对象
 */
+ (instancetype)shareManager;



/*******************************push 操作*******************************
 *  通过viewController的名称加载viewController，并push到当前视图控制器
 *
 *  @param viewControllerName viewController的名称
 */
- (void)pushViewControllerWithName:(NSString *)viewControllerName;


/**
 *  通过viewController的名称加载viewController，并将params的数据赋值给viewController对应的属性
 *
 *  @param viewControllerName viewController的名称
 *  @param params             赋值给viewController的数据
 */
- (void)pushViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params;


/**
 *  通过viewController的名称加载viewController，并将params的数据赋值给viewController对应的属性，以及是否开启push动画
 *
 *  @param viewControllerName viewController的名称
 *  @param params             赋值给viewController的数据
 *  @param animated           是否开启push动画
 */
- (void)pushViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params animated:(BOOL)animated;


/**
 *  通过带有param参数指定的ViewController来替换当前页，以及是否开启push动画
 *
 *  @param viewControllerName viewController的名称
 *  @param params             赋值给viewController的数据
 *  @param animated           是否开启push动画
 */
- (void)replaceViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params animated:(BOOL)animated;


/*******************************pop 操作*******************************
 *  pop当前viewController，并将params的数据赋值给前一个viewController
 *
 *  @param params 赋值给前一个viewController的数据
 *
 *  @return 被pop的viewController
 */
- (UIViewController *)popViewControllerWithParams:(NSDictionary *)params;


/**
 *  pop到指定name的viewController上，并将params的数据赋值给指定name的viewController
 *
 *  @param viewControllerName pop到指定viewController的name
 *  @param params             赋值给指定name的viewController数据
 *
 *  @return 被pop的viewController组成的数组
 */
- (NSArray *)popToViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params;


/**
 *  pop到rootViewController，并将params的数据赋值给rootViewController
 *
 *  @param params 赋值给rootViewController数据
 *
 *  @return 被pop的viewController组成的数组
 */
- (NSArray *)popToRootViewControllerWithParams:(NSDictionary *)params;


/**
 *  pop到rootViewController，并将params的数据赋值给rootViewController，以及是否开启push动画
 *
 *  @param params   赋值给rootViewController数据
 *  @param animated 是否开启push动画
 *
 *  @return 被pop的viewController组成的数组
 */
- (NSArray *)popToRootViewControllerWithParams:(NSDictionary *)params animated:(BOOL)animated;


/*******************************present 操作*******************************
 *  通过viewControllerName的名称加载viewController，并present到当前视图控制器
 *
 *  @param viewControllerName viewController的名称
 */
- (void)presentViewControllerWithName:(NSString *)viewControllerName;


/**
 *  present到viewControllerName的名称加载viewController，并将params的数据赋值给viewController
 *
 *  @param params 赋值给viewController数据
 *
 */
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params;


/**
 *  present到viewControllerName的名称加载viewController，并将params的数据赋值给viewController
 *
 *  @param params   赋值给viewController数据
 *  @param animated 是否开启present动画
 *
 */
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params inNavigationController:(BOOL)inNavigationController;


/**
 *  present到viewControllerName的名称加载viewController，并将params的数据赋值给viewController，以及是否开启present动画
 *
 *  @param params   赋值给viewController数据
 *  @param animated 是否开启present动画
 *
 */
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params inNavigationController:(BOOL)inNavigationController animated:(BOOL)animated;




@end
