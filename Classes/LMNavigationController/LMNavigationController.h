//
//  LMNavigationController.h
//  LMCommonKit
//

//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  自定义左侧滑手势

/**     禁用自定义的左滑手势
 *
 *      if ([self.navigationController isKindOfClass:[THNavigationController class]]) {
 *
 *          [(THNavigationController *)self.navigationController setDragBackEnable:NO];
 *      }
 */

#import <UIKit/UIKit.h>

@interface LMNavigationController : UINavigationController <UIGestureRecognizerDelegate>


/**
 *  侧滑手势是否可用
 */
@property (nonatomic,assign) BOOL sideslipGesturEnable; // Enable the drag to back interaction, Defalt is YES.

@end
