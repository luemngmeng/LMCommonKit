//
//  LMLoopScrollView.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseScrollView.h"

@interface LMLoopScrollView : LMBaseScrollView<UIScrollViewDelegate> {
    
    /**
     *  滚动视图页面控制器数量
     */
    NSInteger pageControllerCount;
    
    
    /**
     *  当前显示页面的索引
     */
    NSInteger currentPageIndex;
    
    
    /**
     *  滚动视图的滚动计时器
     */
    NSTimer * scrollTimer;
    
}


/**
 *  滚动视图的页面控制器
 */
@property (nonatomic, strong)  UIPageControl *pageController;

@end
