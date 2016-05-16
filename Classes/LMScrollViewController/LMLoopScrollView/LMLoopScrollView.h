//
//  LMLoopScrollView.h
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  循环滚动视图的封装（水平方向）

#import "LMBaseScrollView.h"


@protocol LMLoopScrollViewDelegate <NSObject>

@optional

/**
 *  点击被选中的循环滚动视图
 *
 *  @param selectIndex 被选中视图的索引
 */
- (void)touchItemWithSelectIndex:(NSUInteger)selectIndex;

@end

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
 *  回调对象
 */
@property (nonatomic, weak) id<LMLoopScrollViewDelegate> delegate;


/**
 *  滚动视图的页面控制器
 */
@property (nonatomic, strong)  UIPageControl *pageController;



/**
 *  根据保存THAdvertModel对象的数组配置view的显示信息
 *
 *  @param dateSourceArray 
 */
- (void)setupViewWithDateSourceArray:(NSArray *)dateSourceArray;



/**
 *  设置滚动条的图片名数组和标题数组
 *
 *  @param imageURLArray
 *  @param titleArray    
 */
- (void)setContentViewWithImageURLArray:(NSArray *)imageURLArray titleArray:(NSArray *)titleArray;



/**
 *  在滚动条上添加一条广告横幅
 *
 *  @param imageURL 
 *  @param title
 */
- (void)addBannerWithImageURL:(NSString *)imageURL title:(NSString *)title;



/**
 *  开启自动播放功能
 *
 *  @param interval 自动播放的时间的间隔
 */
- (void)startAutoplay:(NSTimeInterval)interval;



/**
 *  关闭自动播放功能
 */
- (void)stopAutoplay;


@end
