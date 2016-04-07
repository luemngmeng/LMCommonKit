//
//  LMSlidingLineSegmentView.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/5/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  点击滑动效果带有横线滑动动画的segmentView

#import "LMSlidingLineSegmentView.h"
#import "LMStringUtil.h"

@interface LMSlidingLineSegmentView ()<UIScrollViewDelegate> {
    
    NSInteger _selectIndex;
    NSInteger _differIndex ;  // 最后一页与第一页相差几个索引
    NSInteger _totalPage;  // 总页数
    NSInteger _preIndex ;  // 记录当前页面的前一页
    CGFloat _currentOffsetX;  // 当前减速时的偏移量
}

/**
 *  横线指示条（默认蓝色）
 */
@property (nonatomic,strong) UIImageView *horizontalLineImageView;


@end

@implementation LMSlidingLineSegmentView

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray *)itemArray{
    
    if (self = [super initWithFrame:frame itemArray:itemArray]) {

        // 设置默认数据（总页数和相差index）
        NSInteger count = itemArray.count;
        _selectIndex = 0;
        _differIndex = (count % SEGMENT_SCROLLVITE_COUNT == 0 ?  SEGMENT_SCROLLVITE_COUNT : count % SEGMENT_SCROLLVITE_COUNT);
        _totalPage = (int)(count % SEGMENT_SCROLLVITE_COUNT == 0 ?  (count / SEGMENT_SCROLLVITE_COUNT): (count / SEGMENT_SCROLLVITE_COUNT ) + 1);
        _preIndex = 0;  // 默认当前一页是 0
    }
    
    return self;
}


#pragma mark - Getter Method
- (UIImageView *)horizontalLineImageView {
    
    if (!_horizontalLineImageView) { // 原始frame是
        _horizontalLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, self.frame.size.height - 2, 30, 2)];
        _horizontalLineImageView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.6];  // 暂时默认为蓝色
    }
    
    return _horizontalLineImageView;
}


#pragma mark - Private Method
#pragma mark 配置选中状态的segmentView(selectIndex 只有0~4)
- (void)selectItemAtCurrentIndex:(NSInteger)currentIndex  selectIndex:(NSInteger)selectIndex slideAnimationEnable:(BOOL)slideAnimationEnable{
    
    UIButton *button = (UIButton *)[self viewWithTag:CONTENT_BUTTON_TAG + currentIndex];
    if (button.selected == YES) {
        return;
    }

    
    // 改变item的选中状态
    [self changeSelectItemStatusWithCurrentIndex:currentIndex selectIndex:selectIndex slideAnimationEnable:slideAnimationEnable];
    
    
    _selectIndex = currentIndex;
}


#pragma mark 设置为正常状态
- (void)changeSelectItemStatusWithCurrentIndex:(NSInteger)index selectIndex:(NSInteger)selectIndex slideAnimationEnable:(BOOL)slideAnimationEnable{
    
    //改变contentButton的选中状态
    [self changeSelectButtonStatusWithCurrentIndex:index];
    

    // 改变横线条的选中状态
    [self changeSelectHorizontalLineImageViewStatusWithSelectIndex:selectIndex slideAnimation:slideAnimationEnable];
}


#pragma mark 改变contentButton的选中状态
- (void)changeSelectButtonStatusWithCurrentIndex:(NSInteger)currentIndex {
    
    for (int i = 0; i< self.itemArray.count; i++) {
        
        UIButton *contentButton = (UIButton *)[self viewWithTag:CONTENT_BUTTON_TAG + i];
        if (currentIndex == i) { //设置选中的状态
            contentButton.selected = YES;
            continue;
        }
        contentButton.selected = NO;
    }
}


#pragma mark 改变横线条的选中状态
- (void)changeSelectHorizontalLineImageViewStatusWithSelectIndex:(NSInteger)selectIndex slideAnimation:(BOOL)slideAnimation {
    
    if (slideAnimation) {  // 是否需要滑动动画
        // 更新横线滑动条的frame
        [self updateHorizontalLineImageViewFrameAtIndex:selectIndex];
    }else {
        
    }
}


#pragma mark 更新横线滑动条的frame
- (void)updateHorizontalLineImageViewFrameAtIndex:(NSInteger)index{
    
    UIButton *contentButton = (UIButton *)[self viewWithTag:CONTENT_BUTTON_TAG + index];
    CGFloat horizontalLineImageViewWidth = contentButton.frame.size.width;
    if (![LMStringUtil isEmptyStringWith:contentButton.titleLabel.text]) {
        
        CGSize contentButtonTitleSize = [LMStringUtil calculateTextSizeWithText:contentButton.titleLabel.text TextFont:contentButton.titleLabel.font constrainedToSize:self.frame.size lineBreakMode:NSLineBreakByWordWrapping textAlignment:contentButton.titleLabel.textAlignment];
        horizontalLineImageViewWidth = contentButtonTitleSize.width;
    }
    
    // 更新横线滑动条的frame
    CGRect horizontalLineImageViewFrame = self.horizontalLineImageView.frame;
    horizontalLineImageViewFrame.origin.x = index * SEGMENTVIEW_WIDTH + (SEGMENTVIEW_WIDTH - horizontalLineImageViewWidth) / 2.0f - 2;
    horizontalLineImageViewFrame.size.width = horizontalLineImageViewWidth + 2;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.horizontalLineImageView.frame = horizontalLineImageViewFrame;
    } completion:^(BOOL finished) {
    }];
}


#pragma mark scrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    //NSLog(@"offsetX = %f",offsetX);
    if (_currentOffsetX == offsetX ) { // 判断是否有滑动到下一页或者上一页（没滑动就不需要改变状态）
        return;
    }
    
    // 判断是否左右滑动
    CGPoint panPoint = [scrollView.panGestureRecognizer translationInView:scrollView];
    

    // 获取当前页数
    NSInteger currentIndex ;
    NSInteger differIndex ;
    NSInteger currentPage = [[LMStringUtil roundingWithFloatingNumber:(offsetX / DEVICE_SCREEN_WIDTH)] floatValue];

    /*
     *  左滑还是右滑
     *  1、一页一页滑动 2、多页多页滑动 3、是不是最后一页
     */
    if (panPoint.x < 0) {  // 向右滑动

        
        NSInteger differPage = currentPage - _preIndex;
        
        if (currentPage == _totalPage - 1) {  // 最后一页
            
            differIndex = SEGMENT_SCROLLVITE_COUNT - _differIndex;
            
        } else {
            differIndex = 0;
        }
        
        currentIndex = _selectIndex +  differPage * SEGMENT_SCROLLVITE_COUNT - differIndex;
        
        
    } else {  // 向左滑动
        
        
        NSInteger differPage = _preIndex - currentPage;
        
        if (_preIndex == _totalPage - 1){  // 最后一页的前一页
            
            differIndex = SEGMENT_SCROLLVITE_COUNT - _differIndex;
            
        } else {
            differIndex = 0;
        }
        
        currentIndex = _selectIndex -  (differPage * SEGMENT_SCROLLVITE_COUNT - differIndex);
    }

    
    // 设置默认选中状态
    [self selectItemAtCurrentIndex:currentIndex selectIndex:_selectIndex slideAnimationEnable:NO];
    
    
    _currentOffsetX = offsetX; // 当前显示页，避免重复刷新状态

    _preIndex = currentPage ;  // 记录当前页面的前一页
}


#pragma mark - Public Method
- (void)setupScrollView {
    

    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    // 添加横线指示条（默认蓝色）
    [self addSubview:self.horizontalLineImageView];
    

    // 设置默认选中状态
    [self selectItemAtCurrentIndex:0 selectIndex:0 slideAnimationEnable:YES];
    
}


#pragma mark item的选中状态
- (void)contentButtonClick:(UIButton *)button {
    

    NSInteger selectIndexTag = button.tag - CONTENT_BUTTON_TAG; // 当前index
    NSInteger currentShowButtonTag;
    
    if (_preIndex == _totalPage - 1 && _totalPage != 1) {  // 最后一页需要特殊处理
        // 计算偏离了differ索引之后对应的显示在0位置的ndex
        NSInteger showZeroPositionIndex = ((_preIndex - 1)*SEGMENT_SCROLLVITE_COUNT + _differIndex);
        currentShowButtonTag = (selectIndexTag - showZeroPositionIndex ) + 0; // 当前显示的索引
        
    } else {  // 不是最后一页，正常处理

        if ((selectIndexTag / SEGMENT_SCROLLVITE_COUNT) == 0) {
            currentShowButtonTag = selectIndexTag;
        } else {
            currentShowButtonTag = selectIndexTag % SEGMENT_SCROLLVITE_COUNT;  // 显示选中的index（数值只在0~4之间）
        }
    }
    

    // 更新状态
    [self selectItemAtCurrentIndex:selectIndexTag selectIndex:currentShowButtonTag slideAnimationEnable:YES];
    
}

@end
