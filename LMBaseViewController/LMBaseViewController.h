//
//  LMBaseViewController.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/22/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMButton.h"

/**
 *  导航栏返回按钮的点击事件的block回调
 */
typedef void(^LMBackButtonClickBlock)(void);


@interface LMBaseViewController : UIViewController  {
    
}


/**
 *  是否使用页面控制器管理类
 */
@property (nonatomic, assign) BOOL isVcManagerEnable;


/**
 *  保存正在执行请求的taskArray
 */
@property (nonatomic, strong) NSMutableArray *requestTaskArray;



/**
 *  状态栏的风格
 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;


/**
 *  状态栏的隐藏状态
 */
@property (nonatomic, assign) BOOL statusBarHidden;


/**********************导航栏上的内容设置************************/
/**
 *  左侧导航条按钮
 */
@property(nonatomic,strong) UIButton  *navBarLeftItemButton;


/**
 *  左侧导航条按钮显示标题
 */
@property(nonatomic,strong) NSString *navBarLeftItemButtonTitle;


/**
 *  左侧按钮显示的图片名称(setImage not setBackGroundImage)
 */
@property (nonatomic, strong) NSString *navBarLeftItemButtonImageName;


/**
 *  右侧导航条按钮
 */
@property (nonatomic, strong) UIButton *navBarRightItemButton;


/**
 *  右侧按钮显示的标题
 */
@property (nonatomic, strong) NSString *navBarRightItemButtonTitle;


/**
 *  右侧按钮显示的图片名称
 */
@property (nonatomic, strong) NSString *navBarRightItemButtonImageName;




/**
 *  自定义的返回按钮
 */
@property (nonatomic,strong) LMButton *backButton;


/**
 *  点击返回按钮后调用的block
 */
@property (nonatomic,strong) LMBackButtonClickBlock backButtonClickBlock;

/**********************导航栏上的内容设置属性定义完成、************************/


/**
 *  设置导航栏上返回按钮标题
 *
 *  @param title 标题内容
 */
- (void)setNavBarBackButtonTitle:(NSString *)title;


/**
 *  设置导航栏上返回按钮背景颜色
 *
 *  @param color UIColor对象
 *  @param state 按钮状态
 */
- (void)setNavBarBackButtonBackgroundColor:(UIColor *)color forState:(UIControlState)state;


/**
 *  点击返回按钮后调用
 */
- (void)backButtonClick;


/**
 *  左侧导航栏按钮图片名，是否带圆角
 *
 *  @param leftImageName
 *  @param corner
 */
- (void)setNavBarLeftButtonItemImageName:(NSString *)leftImageName;


/**
 *  左侧按钮的点击事件
 */
- (void)navBarLeftItemButtonClick;


/**
 *  右侧导航栏按钮图片名，是否带圆角
 *
 *  @param leftImageName
 *  @param corner
 */
- (void)setNavBarRightButtonItemImageName:(NSString *)rightImageName;


/**
 *  右侧按钮的点击事件
 */
- (void)navBarRightItemButtonClick;


/**********************网络与数据刷新显示隐藏模块************************/



/**
 *  取消正在执行的网络请求
 */
- (void)cancelRequestingTask;

@end
