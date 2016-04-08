//
//  TestOneViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "TestOneViewController.h"

#import "LMLoopScrollView.h"
#import "LMLoopScrollViewModel.h"

@interface TestOneViewController ()<LMLoopScrollViewDelegate>


/**
 *  循环滚动视图的数据源
 */
@property (nonatomic,strong)  NSMutableArray *loopScrollViewDateArray;


/**
 *  循环滚动视图
 */
@property (nonatomic,strong)  LMLoopScrollView *loopScrollView;

@end

@implementation TestOneViewController

#pragma mark lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试循环滚动视图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加数据源
    self.loopScrollViewDateArray = [[NSMutableArray alloc] init];
    for (int i = 1 ; i <= 4 ; i++) {
        
        LMLoopScrollViewModel *loopScrollViewModel = [[LMLoopScrollViewModel alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"guide%d.png",i];
        loopScrollViewModel.imageUrl = imageName;
        
        if (loopScrollViewModel) {
            [self.loopScrollViewDateArray addObject:loopScrollViewModel];
        }
    }
    
    //测试循环滚动视图
    [self.view addSubview:self.loopScrollView];
    [self setUpScrollViewWith:self.loopScrollViewDateArray];

    
}


- (void)dealloc {
    
    [_loopScrollView stopAutoplay];
    [_loopScrollView removeFromSuperview];
    _loopScrollView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method
#pragma mark 获取循环滚动视图
- (LMLoopScrollView *)loopScrollView {
    
    if (!_loopScrollView) {
        _loopScrollView = [[LMLoopScrollView alloc] initWithFrame:self.view.frame];
        _loopScrollView.delegate = self;
        _loopScrollView.backgroundColor = [UIColor clearColor];
        [_loopScrollView startAutoplay:5];
    }
    
    return _loopScrollView;
}


#pragma mark LMLoopScrollView Delegate
- (void)touchItemWithSelectIndex:(NSUInteger)selectIndex {
    
    NSLog(@"第%d个视图被点击了",(int)selectIndex);
    
}


#pragma mark - Public Method
- (void)setUpScrollViewWith:(id)model {
    
    // 刷新界面
    if ([model isKindOfClass:[NSArray class]]) {
        
        NSArray *dateSourceArray = (NSArray *)model;
        [self.loopScrollView setupViewWithDateSourceArray:dateSourceArray];
        [self.loopScrollView startAutoplay:5];
    }
}


@end
