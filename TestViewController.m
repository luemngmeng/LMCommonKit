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

#import "LMViewControllerManager.h"
#import "LMSegmentScrollView.h"
#import "LMSlidingLineSegmentView.h"

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
    
    NSArray *itemArray11 = [[NSArray alloc] initWithObjects:@"你好说吧",@"我好说呢",@"大家好吧",@"才是好吧" ,@"你说打的" ,@"是不是吗" ,nil];
    LMSegmentScrollView *segmentScrollView = [[LMSegmentScrollView alloc] initWithFrame:CGRectMake(0, 100,self.view.frame.size.width, 40) itemArray:itemArray11];
    [segmentScrollView setupScrollViewWithModel:nil];
    [self.view addSubview:segmentScrollView];
    
    NSArray *itemArray22 = [[NSArray alloc] initWithObjects:@"你好1",@"我好1",@"大家好1",@"是好1" ,@"你说2" ,@"是不2",@"大家好2",@"是好2" ,@"你说3" ,@"是不3" ,nil];
    LMSlidingLineSegmentView *slidingLineSegmentScrollView = [[LMSlidingLineSegmentView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, 40) itemArray:itemArray22];
    [slidingLineSegmentScrollView setupScrollViewWithModel:nil];
    [self.view addSubview:slidingLineSegmentScrollView];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
