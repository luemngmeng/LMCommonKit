//
//  LMBaseTableViewController.m
//  LMCommonKit
//
//  Created by mengmenglu on 4/26/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMBaseTableViewController.h"
#import "LMBaseTableViewCell.h"

/**
 *  tableView 的分割线的颜色
 */
#define THTABLEVIEW_SEPERATE_COLOR UIColorFromRGB(0XE4E4E4)


@interface LMBaseTableViewController ()

@end

@implementation LMBaseTableViewController


#pragma mark - lifeCycle

- (instancetype)init {
    
    self = [super init];
    
    if (self) {

        self.scrollToTopEnable = YES;
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {

        self.scrollToTopEnable = YES;
    }
    
    return self;
    
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {

        self.scrollToTopEnable = YES;
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 添加刷新视图
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    // 配置UITableView视图
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    
    // 去除最后的分割钱 plain
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorColor  = THTABLEVIEW_SEPERATE_COLOR;
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    
    // 配置子视图
    [self setupTableView];
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


#pragma mark - Private Method
#pragma mark 通过nib文件名称注册cell
- (void)registerCellWithNibName:(NSString *)nibName reuseIdentifier:(NSString *)identifier {
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    if (!nib) {
        return;
    }
    
    self.defaultCellReuseIdentifier = identifier;
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
    
}


#pragma mark 通过类名注册cell
- (void)registerCellWithClassName:(NSString *)className reuseIdentifier:(NSString *)identifier {
    
    Class class = NSClassFromString(className);
    if (!class) {
        return;
    }
    
    self.defaultCellReuseIdentifier = identifier;
    [self.tableView registerClass:class forCellReuseIdentifier:identifier];
    
}


#pragma mark  -  UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = [indexPath row];
    LMBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.defaultCellReuseIdentifier];
    
    if ([self.dataSource count] > row) {
        
        id model = [self.dataSource objectAtIndex:row];
        [cell setupViewWithModel:model];
        [cell.textLabel setText:model];
    }
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


// 设置分割线与cell边框的间距为0
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    /*
    if (self.isShowCustomBottomRefresh) {
        
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        
        if (self.customBottomRefreshBgView && contentOffsetY <= -self.customBottomRefreshBgView.height) {
            
            if (!decelerate) {
                
                [self requestTableViewDataSource];
                
            } else {
                
                //self.needReloadData = YES;
            }
        }
    }*/
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    /*
    if (self.isShowCustomBottomRefresh && self.needReloadData) {
        
        [self requestTableViewDataSource];
        
    }*/
}


#pragma mark - Getter Method
#pragma mark 列表数据源
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
    }
    
    return _dataSource;
}


#pragma mark - Public Method
#pragma mark 配置tableView
- (void)setupTableView {
    
    self.tableView.sectionFooterHeight = 20;
    
    // 注册默认的cell
    [self registerCellWithClassName:NSClassToString(LMBaseTableViewCell) reuseIdentifier:NSClassToString(LMBaseTableViewCell)];
    
}


#pragma mark scrollView内容移动到顶层
- (void)scrollToTop:(BOOL)animated {
    
    if (!self.scrollToTopEnable)
        return;
    
    [self.tableView setContentOffset:CGPointMake(0,0) animated:animated];
    
}


#pragma mark scrollView内容移动到底层
- (void)scrollToBottom:(BOOL)animated {
    
    
    if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
       return;
    }
    
    
    NSUInteger sectionCount = [self.tableView numberOfSections];
    if (sectionCount)
    {
        NSUInteger rowCount = [self.tableView numberOfRowsInSection:0];
        
        if (rowCount) {
            
            NSUInteger i[2] = {0, rowCount - 1};
            NSIndexPath * indexPath = [NSIndexPath indexPathWithIndexes:i length:2];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animated];
            
        }
    }
}


#pragma mark 请求列表数据（需重写）
- (void)requestTableViewDataSource {
    
}




@end
