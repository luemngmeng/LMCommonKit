//
//  LMZoomSegmentView.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/5/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  点击滑动效果带有缩放动画的segmentView

#import "LMZoomSegmentView.h"

@interface LMZoomSegmentView ()<UIScrollViewDelegate> {
    
    NSInteger _selectIndex;
    NSInteger _differIndex ;  // 最后一页与第一页相差几个索引
    NSInteger _totalPage;  // 总页数
    NSInteger _preIndex ;  // 记录当前页面的前一页
    CGFloat _currentOffsetX;  // 当前减速时的偏移量
}

@end

@implementation LMZoomSegmentView

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


#pragma mark - Private Method
#pragma mark 配置选中状态的segmentView(selectIndex 只有0~4)
- (void)selectItemAtCurrentIndex:(NSInteger)currentIndex  selectIndex:(NSInteger)selectIndex slideAnimationEnable:(BOOL)slideAnimationEnable{
    

    
    // 改变item的选中状态
    [self changeSelectItemStatusWithCurrentIndex:currentIndex selectIndex:selectIndex slideAnimationEnable:slideAnimationEnable];
    
    
    _selectIndex = currentIndex;
}


#pragma mark 设置为正常状态
- (void)changeSelectItemStatusWithCurrentIndex:(NSInteger)index selectIndex:(NSInteger)selectIndex slideAnimationEnable:(BOOL)slideAnimationEnable{
    
    //改变contentButton的选中状态
    [self changeSelectButtonStatusWithCurrentIndex:index];
}


#pragma mark 改变contentButton的选中状态
- (void)changeSelectButtonStatusWithCurrentIndex:(NSInteger)currentIndex {
    
    for (int i = 0; i< self.itemArray.count; i++) {
        
        UIButton *contentButton = (UIButton *)[self viewWithTag:CONTENT_BUTTON_TAG + i];
        if (currentIndex == i) { //设置选中的状态

            contentButton.selected = YES;
            [self scaleAnimationWithScale:CGAffineTransformMakeScale(1.1, 1.1) contentButton:contentButton];
            continue;
        }
        
        [self scaleAnimationWithScale:CGAffineTransformMakeScale(1.0, 1.0) contentButton:contentButton];
        contentButton.selected = NO;
        
    }
}


#pragma mark 缩放动画，根据缩放比例
- (void)scaleAnimationWithScale:(CGAffineTransform)scale contentButton:(UIButton *)button{
    
    [UIView animateWithDuration:0.24 animations:^{
        button.transform = scale;
    } completion:^(BOOL finished) {
        button.transform = scale;
    }];

}


#pragma mark - Public Method
- (void)setupScrollView {
    
    
    self.scrollView.delegate = self;
    
    
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
