//
//  LMViewControllerManager.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/22/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMViewControllerManager.h"

#import "LMCommonkitHeader.h"
#import "LMStringUtil.h"

#import "LMNavigationController.h"

@interface LMViewControllerManager ()

@end

@implementation LMViewControllerManager


#pragma mark - Public Method 
#pragma mark 单例
+ (instancetype)shareManager {
    
    static LMViewControllerManager *shareManager = nil;
    
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        shareManager = [[self alloc] init];
    });
    
    return shareManager;
}



#pragma mark 获取当前正在使用NavCtrl
- (UINavigationController *)currentNavCtrl {
    
    if (self.currentVC) {
        return self.currentVC.navigationController;
    } else {
        return nil;
    }
}


#pragma mark --------------------push ViewController -------------------
#pragma mark 通过viewController的名称加载viewController
- (void)pushViewControllerWithName:(NSString *)viewControllerName {
    
    [self pushViewControllerWithName:viewControllerName params:nil];
}



#pragma mark 通过ViewController的名称加载viewController，并将params的数据赋值给viewController对应的属性，以及是否开启push动画
- (void)pushViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params {
    
    [self pushViewControllerWithName:viewControllerName params:params animated:YES];
}



#pragma mark 通过ViewController的名称加载viewController，并将params的数据赋值给viewController对应的属性，以及是否开启push动画
- (void)pushViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params animated:(BOOL)animated {
    
    // 防止viewController重复Push
    if (self.currentVC.navigationController) {
        
        NSString *lastVCname = NSStringFromClass([[self.currentVC.navigationController.viewControllers lastObject] class]);
        if ([lastVCname isEqualToString:viewControllerName]) {
            return;
        }
    }
    
    
    UIViewController *viewController = [self createViewControllerFromName:viewControllerName params:params];
    if (!viewControllerName) {
        return;
    }
    
    
    if (self.currentVC.navigationController) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self.currentVC.navigationController pushViewController:viewController animated:animated];
    }
    
}



#pragma mark 通过带有param参数指定的ViewController来替换当前页，以及是否开启push动画
- (void)replaceViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params animated:(BOOL)animated {
    
    UIViewController *viewController = [self createViewControllerFromName:viewControllerName params:params];
    if (!viewController)  {
        return;
    }
    
    
    if (self.currentVC.navigationController) {
        
        NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.currentVC.navigationController.viewControllers];
        [viewControllers removeLastObject]; // 删除堆栈中最上面一个视图（当前页面）
        [viewControllers addObject:viewController]; // 添加新的替换的视图
        
        
        viewController.hidesBottomBarWhenPushed = YES;
        [self.currentVC.navigationController pushViewController:viewController animated:animated];
    }
}


#pragma mark --------------------pop ViewController -------------------
#pragma mark pop当前viewController，并将params的数据赋值给前一个viewController,并将当前ViewController返回
- (UIViewController *)popViewControllerWithParams:(NSDictionary *)params {
    
    NSArray *viewControllers = self.currentVC.navigationController.viewControllers;
    if (viewControllers.count <= 1){  // 当堆栈中只有一个视图时不允许pop
        return nil;
    }
    
    
    UIViewController *viewController = [viewControllers objectAtIndex:[viewControllers count] - 2];
    if (!viewController) {  // pop当上一页面的视图为空
        return nil;
    }
    
    
    [self setViewControllerWith:viewController params:params];
    return [self.currentVC.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark pop到指定name的viewController上，并将params的数据赋值给指定name的viewController
- (NSArray *)popToViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params {
    
    
    if ([LMStringUtil isEmptyStringWith:viewControllerName]) {
        return nil;
    }
    
    
    Class vcClass = NSClassFromString(viewControllerName);
    if (!vcClass) {
        return nil;
    }
    
    
    __block __weak UIViewController *viewController = nil;
    NSArray *viewControllers = self.currentVC.navigationController.viewControllers;
    [viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:vcClass]) {
            viewController = obj;
            *stop = YES;
        }
    }];
    
    
    NSArray *resultArray = nil;
    if (viewController) {
        
        [self setViewControllerWith:viewController params:params];
        resultArray = [self.currentVC.navigationController popToViewController:viewController animated:YES];
    }
    
    return resultArray;
}



#pragma mark pop到rootViewController，并将params的数据赋值给rootViewController
- (NSArray *)popToRootViewControllerWithParams:(NSDictionary *)params {
    
    return [self popToRootViewControllerWithParams:params animated:YES];
}



#pragma mark pop到rootViewController，并将params的数据赋值给rootViewController，以及是否开启push动画
- (NSArray *)popToRootViewControllerWithParams:(NSDictionary *)params animated:(BOOL)animated {
    
    NSArray *viewControllers = self.currentVC.navigationController.viewControllers;
    if (viewControllers.count < 1) {
        return nil;
    }
    
    
    UIViewController *firstVC = [viewControllers firstObject];
    NSArray *resultArray = nil;
    if (firstVC) {
        
        [self setViewControllerWith:firstVC params:params];
        resultArray = [self.currentVC.navigationController popToViewController:firstVC animated:animated];
    }
    
    return resultArray;
}



#pragma mark --------------------present ViewController -------------------
#pragma mark present到指定viewControllerName视图，并带配有params参数,以及是否开启present动画
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params isNavigationController:(BOOL)isNavigationController animated:(BOOL)animated {
    
    
    UIViewController *viewController = [self createViewControllerFromName:viewControllerName params:params];
    if (!viewController) {
        return ;
    }
    
    
    if (isNavigationController && self.currentVC) {
        

        LMNavigationController *navCtrl = [[LMNavigationController alloc] initWithRootViewController:viewController];
        if (TARGET_IS_IOS7_OR_LATER) {
            
            [self.currentVC.view.window.rootViewController presentViewController:navCtrl animated:animated completion:nil];
        } else {
            
            [self.currentVC presentViewController:navCtrl animated:animated completion:nil];
        }
        
        
    } else {
        [self.currentVC presentViewController:viewController animated:animated completion:nil];
    }
    
}



#pragma mark present到指定viewControllerName视图
- (void)presentViewControllerWithName:(NSString *)viewControllerName {
    
    [self presentViewControllerWithName:viewControllerName params:nil];
    
}



#pragma mark present到指定viewControllerName视图，并带配有params参数
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params {
    
    [self presentViewControllerWithName:viewControllerName params:params isNavigationController:NO];
}



#pragma mark present到指定viewControllerName视图，并带配有params参数,以及是否带有导航栏（默认带有present动画）
- (void)presentViewControllerWithName:(NSString *)viewControllerName params:(NSDictionary *)params isNavigationController:(BOOL)isNavigationController {
    
    [self presentViewControllerWithName:viewControllerName params:params isNavigationController:isNavigationController animated:YES];
    
}



#pragma mark - Private Method
#pragma mark 根据名称创建viewController，并将params的数据赋值给viewController
- (UIViewController *)createViewControllerFromName:(NSString *)name params:(NSDictionary *)params {
    
    // 判断params参数值是否属于NDictionary
    if (params && ![params isKindOfClass:[NSDictionary class]]) { // 不为空，且不是NSDictionary
        return nil;
    }
    
    // 通过类名获取类型
    Class currentClass = NSClassFromString(name);
    
    if (!currentClass || ![currentClass isSubclassOfClass:[UIViewController class]]) {
        return nil;
    }
    
    UIViewController *viewController = nil;
    BOOL isExistNibFile = ([[NSBundle mainBundle] pathForResource:name ofType:@"nib"] != nil);
    if (isExistNibFile) {
        viewController = [[currentClass alloc] initWithNibName:name bundle:nil];
    } else {
        viewController = [[currentClass alloc] init];
    }
    
    if (params) { // 配置ViewController的参数
        [self setViewControllerWith:viewController params:params];
    }
    
    return viewController;
}



#pragma mark 将params的数据赋值给viewController
- (void)setViewControllerWith:(UIViewController *)viewController params:(NSDictionary *)params {
    
    if (!params || !viewController) {
        return;
    }
    
    NSArray *keyArray = [params allKeys];
    if ([keyArray count] != 0) {
        
        for (NSString *key in keyArray) {
            
            SEL selector = NSSelectorFromString(key);
            if (selector == 0) {
                continue;
            }
            
            if ([viewController respondsToSelector:selector]) {
                id value = [params objectForKey:key];
                [viewController setValue:value forKey:key];
            }
        }
    }
}

@end
