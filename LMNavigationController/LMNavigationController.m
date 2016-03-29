//
//  LMNavigationController.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/29/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#define DURATION 0.3

#import "LMNavigationController.h"

#import "UIImage+Extension.h"
#import "UIColor+Extension.h"
#import "LMBaseViewController.h"
#import "LMCommonkitHeader.h"


typedef NS_ENUM(NSUInteger,LMPanGestureDirecion) {
    
    THPanGestureDirectionNone,  // 无方向
    
    THPanGestureDirectionUp,   // 向上
    
    THPanGestureDirectionDown,  // 向下
    
    THPanGestureDirectionLeft,  // 向左
    
    THPanGestureDirectionRight,  // 向右
    
};

@interface LMNavigationController () {
    
    CGPoint startTouch;  // 开始触摸
}


/**
 *  是否可移动
 */
@property (nonatomic,assign) BOOL isMoving;


/**
 *  背景视图
 */
@property (nonatomic,strong) UIView *backGroundView;


/**
 *  黑色模糊遮罩层
 */
@property (nonatomic,strong) UIView *blackMask;


@end

@implementation LMNavigationController


- (void)dealloc {
    
    [self clearBackGroundView];
}


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        self.sideslipGesturEnable = YES ;
    }
    
    return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.sideslipGesturEnable = YES;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    
    
    NSDictionary *navTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(0x525252),NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName, nil];
    [self.navigationBar setTitleTextAttributes:navTitleAttributes];
    
    
    // 加上侧滑手势（只支持左侧滑）
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paningGestureReceive:)];
    [self.view addGestureRecognizer:recognizer];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:(BOOL)animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Method
#pragma mark 获取背景视图
- (UIView *)backGroundView {
    
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    
    return _backGroundView;
}


#pragma mark 获取模态视图
- (UIView *)blackMask {
    
    if (!_blackMask) {
        _blackMask = [[UIView alloc] initWithFrame:self.view.bounds];
        _blackMask.backgroundColor = [UIColor blackColor];
    }
    
    return _blackMask;
}


#pragma mark 清空模态背景视图
- (void)clearBackGroundView {
    
    if (self.backGroundView) {
        [self.backGroundView removeFromSuperview];
        self.backGroundView = nil;
    }
}


#pragma mark override the push method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
#warning 后期需要补上其他基本类型的视图
    if ([viewController isKindOfClass:[LMBaseViewController class]]) {  // 保存屏幕截屏(上一视图的屏幕截屏)
        [(LMBaseViewController *)viewController setScreenShotImage:[self captureScreenShotImage]];
    }
    
    [super pushViewController:viewController animated:animated];
    
}


#pragma mark - Utility Methods
#pragma mark 捕获屏幕截图
- (UIImage *)captureScreenShotImage {
    
    UIView *currentView = nil;
    if (self.tabBarController) {
        currentView = self.tabBarController.view;
    } else {
        currentView = self.view;
    }
    
    
    UIGraphicsBeginImageContextWithOptions(currentView.bounds.size, currentView.opaque, 0.0);
    [currentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *captureScreenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return captureScreenShotImage;
}


#pragma mark - UIgestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if (self.viewControllers.count <= 1 || !self.sideslipGesturEnable) {  // 没有开启侧滑手势或者当前导航栏控制器只有一个视图的的时候
        return NO;
    }
    
    // 只支持左侧滑滑动返回
    CGPoint touchPoint = [touch locationInView:self.view.superview];
    if (touchPoint.x > 50) {  // 滑动区域值限制在50单位像素内
        return NO;
    }
    
    return YES;
    
}


#pragma mark 侧滑手势应该实现的方法
- (void)paningGestureReceive:(UIPanGestureRecognizer *)recognizer {
    
    if (self.viewControllers.count <= 1 || !self.sideslipGesturEnable) {  // 没有开启侧滑手势或者当前导航栏控制器只有一个视图的的时候
        return ;
    }
    
    // 获取当前手势的point
    CGPoint touchPoint = [recognizer locationInView:self.view.superview];
    
    
    switch (recognizer.state) {
            
            
        case UIGestureRecognizerStateBegan: {  // 手势开始前
    
            NSLog(@"UIGestureRecognizerStateBegan");
            _isMoving = YES;
            startTouch = touchPoint;
            
            
            //清空视图
            [self clearBackGroundView];
            
            
            // 添加视图
            [self.backGroundView addSubview:self.blackMask];
            [self.view.superview insertSubview:self.backGroundView belowSubview:self.view]; // 添加子视图 在self.view上面 superView 下面
            
            // 设置上一界面的屏幕截图
            UIImage *screenShotImage = nil;
            id lastObject = [self.viewControllers lastObject];
            if ([lastObject isKindOfClass:[LMBaseViewController class]]) {
                screenShotImage = [(LMBaseViewController *)lastObject screenShotImage];
            }
            
            UIImageView *lastScreenShotImageView = [[UIImageView alloc] initWithImage:screenShotImage];
            [self.backGroundView insertSubview:lastScreenShotImageView belowSubview:self.blackMask];
            
        }
            break;
            
            
        case UIGestureRecognizerStateChanged: {  // 手势正在改变的时
            
            if (_isMoving) {
                [self moveViewWithTouchPointX:touchPoint.x - startTouch.x];
            }
            
        }
            break;
            
        case UIGestureRecognizerStateEnded: {  // 手势结束后
            
            NSLog(@"UIGestureRecognizerStateEnded");
            if (touchPoint.x - startTouch.x > 50) {  // 只支持左滑动
                
                
                [UIView animateWithDuration:DURATION animations:^{
                    [self moveViewWithTouchPointX:DEVICE_SCREEN_WIDTH];
                } completion:^(BOOL finished) {
                    
                    
                    // 释放当前视图
                    [self popViewControllerAnimated:NO];
                    
                    
                    // 更改当前视图的frame
                    CGRect frame = self.view.frame;
                    frame.origin.x = 0;
                    self.view.frame = frame;
                    
                    
                    // 设置不再移动
                    _isMoving = NO;
                    self.backGroundView.hidden = YES;
                    
                }];
                
            } else {
                
                
                [UIView animateWithDuration:DURATION animations:^{
                    [self moveViewWithTouchPointX:0];
                } completion:^(BOOL finished) {
                    _isMoving = NO;
                    self.backGroundView.hidden = YES;
                }];
            }
        }
            break;
            
        default:
            
            return;
            break;
    }
}


- (void)moveViewWithTouchPointX:(CGFloat)currentPointX {
    
    
    currentPointX = (currentPointX > DEVICE_SCREEN_WIDTH ? DEVICE_SCREEN_WIDTH : currentPointX);
    currentPointX = (currentPointX < 0 ? 0 : currentPointX);
    
    
    CGRect frame = self.view.frame;
    frame.origin.x = currentPointX;
    self.view.frame = frame;
    
    
    // 设置模态视图的透明度
    float blackViewAlpha = 0.4 - (currentPointX /  800);
    self.blackMask.alpha = blackViewAlpha;
    NSLog(@"blackViewAlpha = %f",blackViewAlpha);
    
}

@end
