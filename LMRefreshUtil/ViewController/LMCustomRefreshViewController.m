//
//  LMCustomRefreshViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 5/9/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMCustomRefreshViewController.h"

@interface LMCustomRefreshViewController ()


/**
 *  tableView的吧诶经视图
 */
@property (nonatomic,strong) UIView *currentTableBgView;

@end

@implementation LMCustomRefreshViewController

#pragma mark - lifeCycle Method

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 添加默认底部刷新视图
    //[self.view insertSubview:self.customBottomRefreshBgView belowSubview:self.tableView]; // belowSubview方法的意思是：插入视图放在这个视图之后
    [self.currentTableBgView addSubview:self.customBottomRefreshBgView];
    [self.tableView setBackgroundView:self.currentTableBgView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


#pragma mark - Private Method
#pragma mark UITableView的背景视图
- (UIView *)currentTableBgView {
    
    if (!_currentTableBgView) {
        _currentTableBgView = [[UIView alloc] initWithFrame:self.tableView.bounds];
    }
    
    return _currentTableBgView;
    
}


#pragma mark 获取自定义底部刷新背景视图
- (UIView *)customBottomRefreshBgView {
    
    if (!_customBottomRefreshBgView) {
        
        _customBottomRefreshBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_SCREEN_WIDTH, kCustom_bottom_refresh_bgView_height)];
        _customBottomRefreshBgView.backgroundColor = UIColorFromRGB(0xF4F4F4);
        _customBottomRefreshBgView.hidden = YES; // 默认这个背景视图是隐藏的
        
        UIImageView *refreshLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_refresh.png"]];
        [_customBottomRefreshBgView addSubview:refreshLogoImageView];
        [refreshLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_customBottomRefreshBgView);
            make.centerY.equalTo(_customBottomRefreshBgView);
            make.width.mas_equalTo(@(142 * DEVICE_SCREEN_WIDTH_SCALE_6));
            make.height.mas_equalTo(@(60 * DEVICE_SCREEN_WIDTH_SCALE_6));
            
        }];
        
    }
    
    return _customBottomRefreshBgView;
}


#pragma 是否显示自定义底部刷新背景视图
- (void)setIsShowCustomBottomRefresh:(BOOL)isShowCustomBottomRefresh {
    
    _isShowCustomBottomRefresh = isShowCustomBottomRefresh;
    self.customBottomRefreshBgView.hidden = !isShowCustomBottomRefresh;
    
}



#pragma mark - UIScrollView Delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    if (contentOffsetY <= -kCustom_bottom_refresh_bgView_height) {
        
        if (!decelerate) {
            
            [self requestTableViewDataSource];
            
        } else {
            
            self.needReloadData = YES;
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (self.needReloadData) {
        
        [self requestTableViewDataSource];
        
    }
}



#pragma mark - Public Method


@end
