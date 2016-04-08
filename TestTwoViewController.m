   //
//  TestTwoViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "TestTwoViewController.h"

#import "LMVerticalLoopScrollView.h"
#import "LMLoopScrollViewModel.h"

@interface TestTwoViewController ()

/**
 *  循环滚动视图的数据源
 */
@property (nonatomic,strong)  NSMutableArray *loopScrollViewDateArray;


/**
 *  循环滚动视图
 */
@property (nonatomic,strong)  LMVerticalLoopScrollView *verticalLoopScrollView;

@end

@implementation TestTwoViewController


- (void)dealloc {
    
    [_verticalLoopScrollView stopAutoplay];
    [_verticalLoopScrollView removeFromSuperview];
    _verticalLoopScrollView = nil;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"循环滚定垂直方向";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加数据源
    self.loopScrollViewDateArray = [[NSMutableArray alloc] init];
    for (int i = 1 ; i <= 4 ; i++) {
        
        LMLoopScrollViewModel *loopScrollViewModel = [[LMLoopScrollViewModel alloc] init];
        NSString *title = [NSString stringWithFormat:@"title test %d",i];
        loopScrollViewModel.title = title;
        
        if (loopScrollViewModel) {
            [self.loopScrollViewDateArray addObject:loopScrollViewModel];
        }
    }
    
    //测试循环滚动视图
    [self.view addSubview:self.verticalLoopScrollView];
    [self setUpScrollViewWith:self.loopScrollViewDateArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method
#pragma mark 获取循环滚动视图
- (LMVerticalLoopScrollView *)verticalLoopScrollView {
    
    if (!_verticalLoopScrollView) {
        _verticalLoopScrollView = [[LMVerticalLoopScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
        _verticalLoopScrollView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _verticalLoopScrollView;
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
        [self.verticalLoopScrollView setupViewWithDateSourceArray:dateSourceArray];
        [self.verticalLoopScrollView startAutoplay:2];
    }
}


@end
