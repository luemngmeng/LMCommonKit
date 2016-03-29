//
//  LMBaseViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/22/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseViewController.h"
#import "LMViewControllerManager.h"

#import "UIImage+Extension.h"

@interface LMBaseViewController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation LMBaseViewController

#pragma mark - lifecycle

- (void)dealloc {
    
    // 视图控制器释放时，该做的操作
    
    
    // 取消正在执行的网络请求
    [self  cancelRequestingTask];
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.isVcManagerEnable = YES;
        self.requestTaskArray = [[NSMutableArray alloc] init];
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.isVcManagerEnable = YES;
        self.requestTaskArray = [[NSMutableArray alloc] init];
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    
    return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.isVcManagerEnable = YES;
        self.requestTaskArray = [[NSMutableArray alloc] init];
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    
    // 假如有导航栏控制器，就添加返回按钮
    if ([self.navigationController.childViewControllers count] > 1) {
        
        // 添加自定义返回按钮
        [self setNavigationBackButtonItemWithDefualtStatus];
    }
    self.navigationController.navigationBar.translucent = NO;  // 默认NO navigationBar背景图是不透明得
    
    // 配置子视图
    [self setupSubViews];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (self.isVcManagerEnable && self.navigationController) {
        [LMViewControllerManager shareManager].currentVC = self;
    }
    
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle animated:animated];
    

    // 设置系统的侧滑手势可用
    /*
     if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
         self.navigationController.interactivePopGestureRecognizer.delegate = self;
         self.navigationController.interactivePopGestureRecognizer.enabled = YES;
     }*/
    
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];

    // 取消正在执行的网络请求的操作
    [self cancelRequestingTask];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Private Method
- (LMButton *)backButton {
    
    if (!_backButton) {
        _backButton = [LMButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 16.0f, 30.0f);
        [_backButton setImage:[UIImage imageNamed:@"trReturn"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
        self.navigationItem.leftBarButtonItem = backButtonItem;
    }
    
    return _backButton;
}

- (void)setNavigationBackButtonItemWithDefualtStatus {
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}



#pragma mark - Public Method
#pragma mark 配置子视图
- (void)setupSubViews {
    
}


#pragma mark 默认状态栏的状态
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}


#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return self.statusBarHidden;
}


#pragma mark 导航栏子视图
#pragma mark 设置导航栏返回按钮标题
- (void)setNavBarBackButtonTitle:(NSString *)title {
    [self.backButton setTitle:title forState:UIControlStateNormal];
}


#pragma mark 设置导航栏上返回按钮背景颜色
- (void)setNavBarBackButtonBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self.backButton setBackgroundImage:[UIImage backButtonImageWithColor:color barMetrics:UIBarMetricsDefault cornerRadius:0.0f] forState:state];
}


#pragma mark 导航栏返回按钮的实现方法
- (void)backButtonClick {
    
    if (self && self.backButtonClickBlock) {
        
        self.backButtonClickBlock();
        
    } else {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark 左侧导航栏按钮
- (UIButton *)navBarLeftItemButton {
    
    if (!_navBarLeftItemButton) {
        
        _navBarLeftItemButton = [LMButton buttonWithType:UIButtonTypeCustom];
        _navBarLeftItemButton.frame = CGRectMake(0, 0, 60, 40);
        _navBarLeftItemButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _navBarLeftItemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_navBarLeftItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_navBarLeftItemButton addTarget:self action:@selector(navBarLeftItemButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navBarLeftItemButton];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    
    return _navBarLeftItemButton;
}


#pragma mark 左侧导航栏按钮标题
- (void)setNavBarLeftItemButtonTitle:(NSString *)navBarLeftItemButtonTitle {
    
    [self.navBarLeftItemButton setTitle:navBarLeftItemButtonTitle forState:UIControlStateNormal];
}


#pragma mark 左侧导航栏按钮图片名，是否带圆角
- (void)setNavBarLeftButtonItemImageName:(NSString *)leftImageName {
    
    [self.navBarLeftItemButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
}


#pragma mark 左侧按钮的点击事件
- (void)navBarLeftItemButtonClick {
    
}


#pragma mark 右侧导航栏按钮
- (UIButton *)navBarRightItemButton {
    
    if (!_navBarRightItemButton) {
        
        _navBarRightItemButton = [LMButton buttonWithType:UIButtonTypeCustom];
        _navBarRightItemButton.frame = CGRectMake(0, 0, 60, 40);
        _navBarRightItemButton.titleLabel.font = [UIFont systemFontOfSize:15];
        //_navBarRightItemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_navBarRightItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_navBarRightItemButton addTarget:self action:@selector(navBarRightItemButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navBarRightItemButton];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
        
    }
    
    return _navBarRightItemButton;
}


#pragma mark 右侧导航栏按钮标题
- (void)setNavBarRightItemButtonTitle:(NSString *)navBarRightItemButtonTitle {
    
    [self.navBarRightItemButton setTitle:navBarRightItemButtonTitle forState:UIControlStateNormal];
}

#pragma mark 右侧导航栏按钮图片名，是否带圆角
- (void)setNavBarRightButtonItemImageName:(NSString *)rightImageName {
    
    [self.navBarRightItemButton setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
}


#pragma mark 右侧按钮的点击事件
- (void)navBarRightItemButtonClick {
    
}


#pragma mark 取消正在进行的网络请求
- (void)cancelRequestingTask {
    
#warning 暂时还没封装网络请求的这块
    for (NSInteger i =0; i < [self.requestTaskArray count]; i++) {
        
    }
}



@end
