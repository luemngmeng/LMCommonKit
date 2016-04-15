//
//  LMAlertUtil.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/14/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  这种弹出信息的类只针对于alert_info.plist文件

#import "LMAlertUtil.h"

#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "WCAlertView.h"
#import "LMResponder.h"

@implementation LMAlertUtil


#pragma mark  根据keyName从alert_info.plist中获取提示框信息并弹出提示框
+ (void)alertViewWithKeyName:(NSString *)keyName delegate:(id)delegate tag:(NSInteger)tag {
    
    
    NSDictionary *alertDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alert_info" ofType:@"plist"]];
    if (!alertDict) { // 从资源文件中获取不到信息
        return;
    }
    
    
    NSDictionary *alertInfo = [alertDict objectForKey:keyName];
    if (alertInfo == nil) {
        return;
    }
    
    
    NSString *title = [alertInfo objectForKey:@"title"];
    NSString *content = [alertInfo objectForKey:@"content"];
    NSArray *buttons = [alertInfo objectForKey:@"buttons"];
    NSString *leftButtonTitle = nil;
    NSString *rightButtonTitle = nil;
    
    int buttonCount = (int)[buttons count];
    switch (buttonCount) {
            
        case 1: {
            leftButtonTitle = [buttons objectAtIndex:0];
        }
            break;
            
        case 2: {
            leftButtonTitle = [buttons objectAtIndex:0];
            rightButtonTitle = [buttons objectAtIndex:1];
        }
            break;
            
        default:
            break;
    }
    
    // 弹出框视图
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:content delegate:delegate cancelButtonTitle:leftButtonTitle otherButtonTitles:rightButtonTitle, nil];
    [alertView setTag:tag];
    [alertView show];
    
}


#pragma mark  根据keyName从alert_info.plist中获取提示框信息并弹出提示框,并带有block回调
+ (void)alertViewWithKeyName:(NSString *)keyName completionBlock:(CompletionBlock)completionBlock tag:(NSInteger)tag {
    
    NSDictionary *alertDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alert_info" ofType:@"plist"]];
    if (alertDict == nil) { // 从资源文件中获取不到信息
        return;
    }
    
    
    NSDictionary *alertInfo = [alertDict objectForKey:keyName];
    if (alertInfo == nil) {
        return;
    }
    
    
    NSString *title = [alertInfo objectForKey:@"title"];
    NSString *content = [alertInfo objectForKey:@"content"];
    NSArray *buttons = [alertInfo objectForKey:@"buttons"];
    NSString *leftButtonTitle = nil;
    NSString *rightButtonTitle = nil;
    
    int buttonCount = (int)[buttons count];
    switch (buttonCount) {
            
        case 1: {
            leftButtonTitle = [buttons objectAtIndex:0];
        }
            break;
            
        case 2: {
            leftButtonTitle = [buttons objectAtIndex:0];
            rightButtonTitle = [buttons objectAtIndex:1];
        }
            break;
            
        default:
            break;
    }
    
    
    [WCAlertView showAlertWithTitle:title message:content customizationBlock:^(WCAlertView *alertView) { 
    } completionBlock:^(NSUInteger buttonIndex, WCAlertView *alertView) {
        
        completionBlock(tag, buttonIndex);
    } cancelButtonTitle:leftButtonTitle otherButtonTitles:rightButtonTitle, nil];
    
}


#pragma mark  根据标题和消息的内容弹出提示框
+ (void)alertViewWithTitle:(NSString*)title message:(NSString *)message delegate:(id)delegate tag:(NSInteger)tag {
    
    // 系统的提示消息
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView setTag:tag];
    [alertView show];
}


#pragma mark  从plist中获取alert的提示信息dictionary
+ (NSDictionary *)queryAlertInfo:(NSString *)key {
    
    NSDictionary *alertDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alert_info" ofType:@"plist"]];
    if (alertDict == nil) {
        return nil;
    }
    
    NSDictionary * alertInfo = [alertDict objectForKey:key];
    if (alertInfo == nil) {
        return nil;
    }
    
    return alertInfo;
    
}


#pragma mark  从plist中获取alert的提示的alertContent信息
+ (NSString *)alertContentFromKey:(NSString *)key {
    
    NSString *alertContent = nil;
    NSDictionary *alertInfo = [LMAlertUtil queryAlertInfo:key];
    if (alertInfo == nil) {
        return nil;
    }
    
    alertContent = [alertInfo objectForKey:AlertContent];
    
    return alertContent;
    
}


#pragma mark  从plist中获取alert的提示的alertContent信息,弹出提示框对应的信息
+ (void)toastFromKey:(NSString *)key {
    
    // 原来使用SVProgressHUD弹出提示语信息（但当跟SVProgressHUD一起使用时候回冲突，为了避免冲突使用最新的方法）
    //[SVProgressHUD showImage:nil status:[self alertContentFromKey:key]];
    
    UIView * view = [LMResponder sharedResponder].rootViewController.view;
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    }
    
    // 弹出提示语的信息的停留时间是2秒
    [SVProgressHUD dismiss];
    [view makeToast:[self alertContentFromKey:key] duration:2 position:CSToastPositionCenter];
    
}

@end
