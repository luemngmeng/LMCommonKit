//
//  TestViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "TestViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "TestThreeViewController.h"

#import "LMViewControllerManager.h"
#import "LMSegmentScrollView.h"
#import "LMSlidingLineSegmentView.h"
#import "LMZoomSegmentView.h"

#import "JCAlertView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
    // 导航栏返回按钮
    [self setNavBarBackButtonTitle:@"你好"];
    [self setNavBarBackButtonBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
     */
    
    
    /*
    // 导航栏左侧按钮
    self.navBarLeftItemButtonTitle = @"你好";
    [self setNavBarLeftButtonItemImageName:@"trReturn"];
    */
    
    
    /*
    // 导航栏右侧按钮
    self.navBarRightItemButtonTitle = @"爱你";
    [self setNavBarRightButtonItemImageName:@"trReturn"];
    */
    
    
    /*
    // 测试按钮
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeSystem];
    testButton.frame = CGRectMake(100, 100, 100, 40);
    [testButton setTitle:@"测试" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    testButton.layer.cornerRadius = 4;
    testButton.layer.borderWidth = 1.0f;
    testButton.clipsToBounds = YES;
    [self.view addSubview:testButton];
     */
    
    
    /*
    // 测试segmentScrollView
    NSArray *itemArray11 = [[NSArray alloc] initWithObjects:@"你好说吧",@"我好说呢",@"大家好吧",@"才是好吧" ,@"你说打的" ,@"是不是吗" ,nil];
    LMSegmentScrollView *segmentScrollView = [[LMSegmentScrollView alloc] initWithFrame:CGRectMake(0, 100,self.view.frame.size.width, 40) itemArray:itemArray11];
    [segmentScrollView setupScrollViewWithModel:nil];
    [self.view addSubview:segmentScrollView];
    
    
    NSArray *itemArray22 = [[NSArray alloc] initWithObjects:@"你好1",@"我好1",@"大家好1",@"是好1",@"大家好吧",@"才是好吧",@"大家好吧",nil];
    LMSlidingLineSegmentView *slidingLineSegmentScrollView = [[LMSlidingLineSegmentView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, 40) itemArray:itemArray22];
    [slidingLineSegmentScrollView setupScrollViewWithModel:nil];
    [self.view addSubview:slidingLineSegmentScrollView];
    
    
    NSArray *itemArray33 = [[NSArray alloc] initWithObjects:@"你好1",@"我好1",@"大家好1",@"是好1" ,@"你说2",nil];
    LMZoomSegmentView *zoomSegmentView = [[LMZoomSegmentView alloc] initWithFrame:CGRectMake(0, 300,self.view.frame.size.width, 40) itemArray:itemArray33];
    [zoomSegmentView setupScrollViewWithModel:nil];
    [self.view addSubview:zoomSegmentView];
     */
    
    
    /*
    // 测试自定义的最左对齐的UIAlertView
    [JCAlertView showOneButtonWithTitle:@"title" Message:@"message" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"好的" Click:^{
        NSLog(@"确定好的");
    }];
     */
    
    
    // 测试自定义刷新效果的
    UIButton *testRefreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testRefreshButton.frame = CGRectMake(100, 300, 200, 49);
    [testRefreshButton setTitle:@"测试刷新功能" forState:UIControlStateNormal];
    [testRefreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [testRefreshButton setBackgroundColor:[UIColor redColor]];
    testRefreshButton.layer.cornerRadius = 5;
    testRefreshButton.layer.masksToBounds = YES;
    
    [testRefreshButton addTarget:self action:@selector(testRefreshBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:testRefreshButton];
    
    
}


#pragma mark 导航栏左侧按钮实现方法
- (void)navBarLeftItemButtonClick {
    
    NSLog(@"实现左侧导航栏按钮的实现方法");
    [[LMViewControllerManager shareManager] pushViewControllerWithName:@"TestOneViewController"];
}


#pragma mark 导航栏右侧按钮实现方法
- (void)navBarRightItemButtonClick {
    
    NSLog(@"实现右侧导航栏按钮的实现方法");
    [[LMViewControllerManager shareManager] pushViewControllerWithName:@"TestTwoViewController"];
}


#pragma mark 导航栏测试按钮实现方法
- (void)testButtonClick {
    
    NSLog(@"测试按钮的实现方法");
    [[LMViewControllerManager shareManager] pushViewControllerWithName:@"TestOneViewController"];
}


#pragma mark 测试刷新功能的按钮
- (void)testRefreshBtnClick:(UIButton *)button {
    
    NSLog(@"测试刷新功能的按钮点击事件");
    [[LMViewControllerManager shareManager] pushViewControllerWithName:@"TestFourViewController"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
