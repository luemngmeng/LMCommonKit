//
//  LMSegmentScrollView.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  segmentScrollow默认只放四个（也就是说在5或之前的宽度为80）

#import "LMSegmentScrollView.h"

@interface LMSegmentScrollView () {

}

@end

@implementation LMSegmentScrollView

#pragma mark - lifeCycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    // 配置scrollView视图
    [self initContentView];
}


#pragma mark 自定义初始化方法（默认不带红点和指示线条）
- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray *)itemArray {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        if (!itemArray){   // 判断传入的数据是否为空
            return nil;
        }
        self.itemArray = itemArray;
        
        // 配置scrollView视图
        [self initContentView];
    }
    
    return self;
}


#pragma mark  初始化内容视图
- (void)initContentView {
    
    // 配置scrollView视图
    self.scrollView = [[UIScrollView alloc] init];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = YES;
    self.scrollView.userInteractionEnabled = YES;
    
    // 配置子视图
    [self configSubView];

}


#pragma mak 配置子视图
- (void)configSubView {
    
    // 获取scrollow的子视图的宽高和大小
    NSInteger count  = self.itemArray.count;
    if ( 0 == count) {  // 防止程序崩溃的问题
        return ;
    }
    CGFloat segmentViewWidth = (CGFloat)self.frame.size.width / count;
    segmentViewWidth = ( segmentViewWidth < SEGMENTVIEW_WIDTH ?  SEGMENTVIEW_WIDTH : segmentViewWidth );
    CGFloat segmentViewHegith = self.frame.size.height;
    
    
    // 设置scrollow的内容
    self.scrollView.contentSize = CGSizeMake( segmentViewWidth * count, segmentViewHegith);
    self.scrollView.pagingEnabled = YES;
    
    
    // 配置scrollow子视图
    [self setupContentViewWithSegmentViewWidth:segmentViewWidth segmentViewHeight:segmentViewHegith itemArrayCount:count];
    
}


#pragma mark 添加内容的子视图
- (void)setupContentViewWithSegmentViewWidth:(CGFloat)segmentViewWidth segmentViewHeight:(CGFloat)segmentViewHeight itemArrayCount:(NSInteger)itemArrayCount{
    
    // 添加子视图
    for (int i = 0 ; i < itemArrayCount; i++) {
        
        NSString *title = self.itemArray[i];
        LMSegmentItem *segmentItem = [[LMSegmentItem alloc] initWithTitle:title normalTitleColor:[UIColor blackColor] selectTitleColor:[UIColor blueColor] normalTextFont:CONTENT_BUTTON_TEXT_FONT];
        LMSegmentView *segmentView = [[LMSegmentView alloc] initWithFrame:CGRectMake(segmentViewWidth * i, 0, segmentViewWidth, segmentViewHeight) segmentItem:segmentItem];
        [segmentView.contentButton addTarget:self action:@selector(contentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        segmentView.isShowRedDot = NO;
        segmentView.tag = SEGMENT_VIEW_TAG + i ;
        segmentView.contentButton.tag = CONTENT_BUTTON_TAG + i ;
        
        [self.scrollView addSubview:segmentView];
        
    }
    
    // 设置子视图、默认状态在index为0处
    [self setupScrollView];
    
}

#pragma mark - Public Method
#pragma mark 配置scrollView及子视图（重写父视图的方法）
- (void)setupScrollViewWithModel:(id)model {
    
}


#pragma mark 设置子视图
- (void)setupScrollView {
    
}


#pragma mark contentButton实现的点击事件
- (void)contentButtonClick:(UIButton *)button {
    
}


@end
