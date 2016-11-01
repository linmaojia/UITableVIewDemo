//
//  DEMO1_VC.m
//  Masonry
//
//  Created by LXY on 16/5/11.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO15_VC.h"
#import "HMSegmentedControl.h"
#import "YZGShopProduductTableView.h"
#import "SVHTTPClient+HistoryLists.h"
#import "YZGBrowsingHistoryModel.h"
#import "SVHTTPClient+newLists.h"
#import "YZGShopConnectionTableView.h"
#import "YZGShopServiceListModel.h"
#import "YZGShopAdressModel.h"
#import <MJRefresh.h>
@interface DEMO15_VC ()
{
    CGRect frames;
    NSInteger _pageNum;   /**< 分页 */
}
@property (nonatomic, strong) HMSegmentedControl *segmentedControl; /**< 分段控制器 */

@property (nonatomic, strong) UIView *curruntShowView; /*当前的显示视图*/

@property (nonatomic, strong) YZGShopProduductTableView *shopProductTableView;/*全部产品界面*/

@property (nonatomic, strong) UIView *latestProductTableView; /*当前的显示视图*/

@property (nonatomic, strong) YZGBrowsingHistoryModel *allModel; /*当前的显示视图*/

/*客服列表界面*/
@property (nonatomic, strong) YZGShopConnectionTableView *shopConnectionTableView;

/*客服列表数据*/
@property (nonatomic, strong) YZGShopServiceListModel *serviceList;

@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, strong) NSMutableArray *newsArray;
//@property (nonatomic, strong) NSMutableArray *allArray;
//@property (nonatomic, strong) NSMutableArray *allArray;
@end

@implementation DEMO15_VC


#pragma mark - 系统方法
-(void)setServiceList:(YZGShopServiceListModel *)serviceList
{
    _serviceList = serviceList;

    self.shopConnectionTableView.serviceListModel = serviceList;
}
- (YZGShopConnectionTableView *)shopConnectionTableView
{
    if (_shopConnectionTableView == nil)
    {
        _shopConnectionTableView = [[YZGShopConnectionTableView alloc] initWithFrame:frames style:UITableViewStyleGrouped];
    }
    return _shopConnectionTableView;
}
- (NSMutableArray *)allArray {
    if (!_allArray) {
        _allArray = [NSMutableArray array];
    }
    return _allArray;
}
- (NSMutableArray *)newsArray {
    if (!_newsArray) {
        _newsArray = [NSMutableArray array];
    }
    return _newsArray;
}
- (YZGShopProduductTableView *)shopProductTableView
{
    if (_shopProductTableView == nil)
    {
        _shopProductTableView = [[YZGShopProduductTableView alloc] initWithFrame:frames style:UITableViewStyleGrouped];
        //上拉加载
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _shopProductTableView.mj_footer = footer;
        [_shopProductTableView setShowProductTableViewDidSelectedCellWithSepId:^(NSString *seqId) {
            
        }];
    }
    return _shopProductTableView;
    
}
- (UIView *)latestProductTableView
{
    if (_latestProductTableView == nil)
    {
        _latestProductTableView = [[UIView alloc] initWithFrame:frames];
        _latestProductTableView.backgroundColor = [UIColor redColor];
    }
    return _latestProductTableView;
}
- (UIView *)curruntShowView
{
    if (_curruntShowView == nil)
    {
        _curruntShowView = [[UIView alloc] initWithFrame:frames];
        _curruntShowView.backgroundColor = [UIColor grayColor];
    }
    return _curruntShowView;
}
- (HMSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"全部商品",@"新品上架",@"客服列表",@"公司信息"]];
        _segmentedControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40 );
        _segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentedControl.selectionIndicatorColor = [UIColor orangeColor];
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.verticalDividerEnabled = YES;
        _segmentedControl.verticalDividerColor = RGB(238, 238, 238);
        _segmentedControl.verticalDividerWidth = 1.f;
        [_segmentedControl setTitleFormatter:^NSAttributedString *(HMSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
            NSAttributedString *attString = nil;
            if (selected) {
                attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : [UIColor orangeColor],NSFontAttributeName : [UIFont systemFontOfSize:16.0f]}];
            } else {
                attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:16.0f]}];
            }
            return attString;
        }];
        [_segmentedControl addTarget:self action:@selector(segmentedControlIndexChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}


#pragma mark - 分栏控制器选择方法
- (void)segmentedControlIndexChange:(HMSegmentedControl *)seg{
    
     [self.curruntShowView removeFromSuperview];
    
    
    switch (seg.selectedSegmentIndex) {
        case 0:
             [self loadAllProductsData];//请求全部产品信息
            break;
        case 1:
            [self loadLatestProductsData];//请求新品上架信息
            break;
        case 2:
            [self loadServersListData];//请求客服列表
            break;
        case 3:
             [self loadCompanyData];//请求公司信息
            break;
        default:
            break;
    }

    
}
#pragma mark **************** 加载公司信息
- (void)loadCompanyData
{

}
#pragma mark **************** 加载客服列表信息
- (void)loadServersListData
{
    [self.view addSubview:self.shopConnectionTableView];
    self.curruntShowView = self.shopConnectionTableView;
    if (self.serviceList == nil)
    {
        ESWeakSelf;
        [SVHTTPClient getNewListsWithTarget:self CallBack:^(NSDictionary *dic) {
            
            __weakSelf.serviceList = [YZGShopServiceListModel shopServiceListModelWithDict:dic[@"edsMer"]];
            __weakSelf.serviceList.brandFaxForSales = dic[@"brandFaxForSales"];
        }];
    }
 
}
#pragma mark **************** 加载最新产品
- (void)loadLatestProductsData
{
    [self.view addSubview:self.latestProductTableView];
     self.curruntShowView = self.latestProductTableView;
    
    NSLog(@"--%@",self.view.subviews);
}
#pragma mark **************** 加载全部产品
- (void)loadAllProductsData
{
    [self.view addSubview:self.shopProductTableView];
     self.curruntShowView = self.shopProductTableView;
    NSLog(@"--%@",self.view.subviews);
    if(self.allArray.count == 0)
    {
        _pageNum = 1;
        [self loadAllData:_pageNum];//加载全部商品
    }
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addConstaints];//控件布局
    
    
}
#pragma mark ************** 上拉加载更多数据
- (void)loadMoreData
{
     _pageNum++;
    [self loadAllData:_pageNum];
    
}
- (void)loadAllData:(NSInteger )pageNums{
   
  
        NSLog(@"--sssssss-%@",self.view.subviews);
        ESWeakSelf;
        [SVHTTPClient getHistoryListsWithPageNum:pageNums Target:self CallBack:^(YZGBrowsingHistoryModel *dic) {
            
             __weakSelf.allModel = dic;
            
            [__weakSelf.allArray addObjectsFromArray:dic.productArr];
            
            __weakSelf.shopProductTableView.products = __weakSelf.allArray;
            
            [__weakSelf.shopProductTableView.mj_footer endRefreshing];

            if(dic.productArr.count == 0)
            {
                [__weakSelf.shopProductTableView.mj_footer endRefreshingWithNoMoreData];//设置没有更多数据
            }
            
        }];

}

#pragma mark - 控件布局
- (void)addConstaints {
    
    frames = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40 - 64 );

    [self.view addSubview:self.segmentedControl];
    
    [self.view addSubview:self.curruntShowView];
  
    [self.view addSubview:self.shopProductTableView];
    
     self.curruntShowView = self.shopProductTableView;
    
    _pageNum = 1;
    
    [self loadAllData:_pageNum];//加载全部商品
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
