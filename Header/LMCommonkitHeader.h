//
//  LMCommonkitHeader.h
//  LMCommonKit
//
//  Created by mengmenglu on 3/24/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#ifndef LMCommonkitHeader_h
#define LMCommonkitHeader_h

// 日志输出
#ifdef DEBUG

#else

  #define NSLog(...)

#endif  

/*****************************************系统版本、设备类型和名称******************************************/

/**
 *  判断系统的版本
 */
#define TARGET_SYSTEM_VERSION [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] integerValue]

#define TARGET_IS_IOS9_OR_LATER    (TARGET_SYSTEM_VERSION >= 9)
#define TARGET_IS_IOS8_OR_LATER    (TARGET_SYSTEM_VERSION >= 8)
#define TARGET_IS_IOS7_OR_LATER    (TARGET_SYSTEM_VERSION >= 7)
#define TARGET_IS_IOS6_OR_LATER    (TARGET_SYSTEM_VERSION >= 6)


/**
 *  判断设备的类型
 */
#define DEVICE_IS_IPHONE_4_OR_LESS  (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH < 568.0)
#define DEVICE_IS_IPHONE_5          (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 568.0)
#define DEVICE_IS_IPHONE_6          (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 667.0)
#define DEVICE_IS_IPHONE_6P         (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 736.0)


/**
 *  判断设备是否是iPad
 */
#define DEVICE_IS_IPAD              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


/**
 *  判断设备是否是iPhone
 */
#define DEVICE_IS_IPHONE            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


/**
 *  判断设备是否是Retina屏
 */
#define DEVICE_IS_RETINA            ([[UIScreen mainScreen] scale] >= 2.0)



/**************************************设备尺寸跟大小*********************************************/

/**
 *  设备屏幕的宽度
 */
#define DEVICE_SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)


/**
 *  设备屏幕的高度
 */
#define DEVICE_SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)


/**
 *  设备屏幕的最大长度
 */
#define DEVICE_SCREEN_MAX_LENGTH    (MAX(DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT))


/**
 *  设备屏幕的最小长度
 */
#define DEVICE_SCREEN_MIN_LENGTH    (MIN(DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT))


/**
 *  设备屏幕基于iPhone4屏幕宽度的比例
 */
#define DEVICE_SCREEN_WIDTH_SCALE   DEVICE_SCREEN_WIDTH / 320.f


/**
 *  设备屏幕基于iPhone4屏幕高度的比例
 */
#define DEVICE_SCREEN_HEIGHT_SCALE  DEVICE_SCREEN_HEIGHT / 480.f


/**
 *  设备屏幕基于iPhone6屏幕宽度的比例
 */

#define DEVICE_SCREEN_WIDTH_SCALE_6   DEVICE_SCREEN_WIDTH / 375.f


/**
 *  设备屏幕基于iPhone6屏幕高度的比例
 */
#define DEVICE_SCREEN_HEIGHT_SCALE_6  DEVICE_SCREEN_HEIGHT / 667.f




/**************************************工具类宏定义*********************************************/
 
/**
 *  将Class转为String
 */
#define NSClassToString(className)  NSStringFromClass([className class])


/**
 *  self的弱引用
 */
#define BLOCK_WEAK_SELF    __weak __typeof(self) weakSelf = self;


/**
 *  weakSelf的弱引用
 */
#define BLOCK_STRONG_SELF  __strong __typeof(weakSelf) strongSelf = weakSelf;



/************************SVProgressHUD加载时显示**************/

/**
 *  SVProgressHUD加载时显示的标题
 */
static NSString * const kLoadingStatus = @"加载中...";
static NSString * const LoadingError =  @"请求异常" ;


/**
*  SVProgressHUD加载时显示的标题(在当前视图上)
 */
#define SVProgressHUD_SHOW                 [SVProgressHUD showWithStatus:kLoadingStatus maskType:SVProgressHUDMaskTypeNone]


/**
 *  SVProgressHUD加载时显示的标题(在window上显示)
 */
#define SVProgressHUD_SHOW_Clear           [SVProgressHUD showWithStatus:kLoadingStatus maskType:SVProgressHUDMaskTypeClear]


/************************SVProgressHUD加载完成后释放，隐藏**************/

/**
 *  SVProgressHUD加载完成后释放（显示相应的内容后再隐藏）
 */
#define SVProgressHUD_SHOW_RESPONSECONTENT [SVProgressHUD showImage:nil status:result.responseContent]


/**
 *  SVProgressHUD加载完成后释放（直接隐藏）
 */
#define SVProgressHUD_DISMISS              [SVProgressHUD dismiss]



/************************G C D **************/
/**
 *  子线程
 *
 *  @param block
 *
 *  @return
 */
#define GCDG_LOBAL(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)


/**
 *  主线程
 *
 *  @param block
 *
 *  @return
 */
#define GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(), block)


/**
 *  时间线程
 */
#define GCD_TIME(time) dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC)


/**
 *  多少时间后执行
 *
 *  @param duration 时间
 *  @param block    block
 *
 *  @return
 */
#define GCD_AFTER(duration,block) dispatch_after(GCD_TIME(duration),dispatch_get_main_queue(),block)


#endif /* LMCommonkitHeader_h */
