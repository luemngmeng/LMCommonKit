//
//  LMLoopScrollView.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/7/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMLoopScrollView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#import "LMLoopScrollViewModel.h"

@interface LMLoopScrollView ()


/**
 *  图片URL数组
 */
@property (nonatomic, strong) NSMutableArray *imageURLArray;


/**
 *  标题数组
 */
@property (nonatomic, strong) NSMutableArray *titleArray;


/**
 *  保存Model对象的数组
 */
@property (nonatomic, strong) NSArray *dataSourceArray;


/**
 *  广告切换间隔
 */
@property (nonatomic, assign) float intervalTime;

@end

@implementation LMLoopScrollView

#pragma mark - Lifecycle
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self setupScrollView];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupScrollView];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupScrollView];
    }
    
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}


#pragma mark - Private Methods
#pragma mark 页面控制器
- (UIPageControl *)pageController {
    
    if (!_pageController) {
        _pageController = [[UIPageControl alloc] init];
        _pageController.currentPage = 0;
        _pageController.numberOfPages = pageControllerCount - 2;
        [_pageController setCenter:CGPointMake(self.bounds.size.width * 0.5f, self.bounds.size.height - 10.f)];
        [_pageController addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _pageController;
}
#pragma mark 配置ScrollView
- (void)setupScrollView {
    
    
    self.scrollView = [[UIScrollView alloc] init];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self);
    }];
    
    
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setScrollsToTop:YES];
    [self.scrollView setBounces:NO];
    [self.scrollView setDelegate:self];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
}


#pragma mark 图片被点击时调用
- (void)imagePressed:(id)sender {
    
    UITapGestureRecognizer * tapGestureRecognizer = (UITapGestureRecognizer *)sender;
    NSInteger  targetIndex = tapGestureRecognizer.view.tag;
    
    if (pageControllerCount>1) {
        targetIndex = targetIndex -1;
    }

}


#pragma mark 改变当前页面
- (void)changePage:(id)sender {
    
    NSInteger page = self.pageController.currentPage + 2;
    
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    
    [self.scrollView scrollRectToVisible:frame animated:YES];
    [self performSelector:@selector(scrollViewDidEndDecelerating:) withObject:nil afterDelay:0.5];
}


#pragma mark 滚动到当前指定的页面()
- (void)scrollToCurrentPage {
    
    if (currentPageIndex == 0) {
        currentPageIndex = [self.imageURLArray count] - 2;
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width * ([self.imageURLArray count] - 2), 0.f) animated:NO];
        
    } else if (currentPageIndex == ([self.imageURLArray count] - 1)) {
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width, 0.f) animated:NO];
        currentPageIndex = 1;
    }
    
    NSInteger currentPage = currentPageIndex - 1;
    [self.pageController setCurrentPage:currentPage];

}


#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    // 计算当前的页面索引
    CGFloat pageWidth = self.scrollView.frame.size.width;
    currentPageIndex = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
    
    // 滚动到指定的位置
    [self scrollToCurrentPage];
    
    // 开始滚动
    [self startAutoplay:self.intervalTime];
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        
        [self scrollToCurrentPage];
        [self startAutoplay:self.intervalTime];
    }
}



#pragma mark - Public Methods
#pragma mark 根据保存THAdvertModel对象的数组配置view的显示信息
- (void)setupViewWithDateSourceArray:(NSArray *)dateSourceArray {
    
    self.dataSourceArray = dateSourceArray;
    NSMutableArray * imageURLArray = [NSMutableArray array];
    NSMutableArray * titleArray = [NSMutableArray array];
    for (LMLoopScrollViewModel *loopScrollViewmodel in dateSourceArray) {
        [imageURLArray addObject:loopScrollViewmodel.imageUrl];  // 保存图片地址
    }
    
    // 设置滚动条的图片名数组和标题数组
    if ([imageURLArray count] > 0) {
        [self setContentViewWithImageURLArray:imageURLArray titleArray:titleArray];
    }
    
    
    // 设置scrollView的内容
    [self setContentViewInScrollView];
    
}


#pragma mark 设置滚动条的图片名数组和标题数组
- (void)setContentViewWithImageURLArray:(NSArray *)imageURLArray titleArray:(NSArray *)titleArray
{
    if ([imageURLArray count] > 0) {
        
        // 移除滚动条上所有的图片界面
        for (UIImageView * imageView in [self.scrollView subviews]){
            [imageView removeFromSuperview];
        }
        
        self.imageURLArray = [NSMutableArray arrayWithArray:imageURLArray];
        if (imageURLArray.count > 1) {  // 多添加两个视图（最前面添加最后一个索引的图片，最后面添加为0索引）
            [self.imageURLArray insertObject:[imageURLArray objectAtIndex:([imageURLArray count] - 1)] atIndex:0];
            [self.imageURLArray addObject:[imageURLArray objectAtIndex:0]];
        }
    }
}


#pragma mark 设置scrollView的内容
- (void)setContentViewInScrollView {
    
    
    pageControllerCount = [self.imageURLArray count];
    [self.scrollView setContentSize:CGSizeMake(self.bounds.size.width * pageControllerCount, self.bounds.size.height)];
    
    CGRect frame = self.bounds;
    for (NSInteger i = 0; i < pageControllerCount; i++) {
        frame.origin.x = frame.size.width * i;
        NSString * imageURL = [self.imageURLArray objectAtIndex:i];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
        [imageView setTag:i];
        
        if ([imageURL hasPrefix:@"http"]) {
            // 网络图片
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"trbanner"]];
            
        } else {
            
            UIImage * image = [UIImage imageNamed:[self.imageURLArray objectAtIndex:i]];
            [imageView setImage:image];
        }
        
        
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
        [tapGestureRecognizer setNumberOfTapsRequired:1];
        [tapGestureRecognizer setNumberOfTouchesRequired:1];
        [imageView setUserInteractionEnabled:YES];
        [imageView addGestureRecognizer:tapGestureRecognizer];
        [self.scrollView addSubview:imageView];
    }
    
    
    [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0)]; // 初始时显示在0的位置
    if (pageControllerCount ==1) {
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    }
    
    
    // 清空页面控制器
    if (self.pageController) {
        [self.pageController removeFromSuperview];
        self.pageController = nil;
    }
    // 添加页面视图控制器
    if (self.imageURLArray.count > 1) {
        self.scrollView.scrollEnabled = YES;
        [self addSubview:self.pageController];
    } else {
        self.scrollView.scrollEnabled = NO;
        [self stopAutoplay];
    }
}


#pragma mark在滚动条上添加一条广告横幅
- (void)addBannerWithImageURL:(NSString *)imageURL title:(NSString *)title
{
    if (!self.imageURLArray){
       self.imageURLArray = [NSMutableArray arrayWithCapacity:5];
    }
    
    
    if (!self.titleArray){
       self.titleArray = [NSMutableArray arrayWithCapacity:5];
    }
    // 添加imageUrlArray 和 titleArray
    if (imageURL) {
        
        [self.imageURLArray addObject:imageURL];
        if (title) {
            [self.titleArray addObject:title];
        }
        
        // 设置scrollView的ContentSzie
        pageControllerCount = [self.imageURLArray count];
        [self.scrollView setContentSize:CGSizeMake(self.bounds.size.width * pageControllerCount, self.bounds.size.height)];
    }
}


#pragma mark 开启自动播放功能
- (void)startAutoplay:(NSTimeInterval)interval
{
    if (pageControllerCount <= 1) {
        return;
    }
    _intervalTime = interval;
    
    [self stopAutoplay];
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(changePage:) userInfo:nil repeats:YES];
}


#pragma mark 关闭自动播放功能
- (void)stopAutoplay
{
    if (scrollTimer) {
        [scrollTimer invalidate];
        scrollTimer = nil;
    }
}


@end
