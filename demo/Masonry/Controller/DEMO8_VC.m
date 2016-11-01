//
//  MyShoppingCarController.m
//  Masonry
//
//  Created by LXY on 16/5/13.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO8_VC.h"
#import "MJShoppingCarCell.h"
#import "MJShoppingCarModel.h"
#import "MJShoppingCarHeaderView.h"
#import "MJScrollerCell.h"
@interface DEMO8_VC ()<UITableViewDelegate, UITableViewDataSource>
{
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSMutableArray *dataArray;    /**< 数据数组 */
@end

@implementation DEMO8_VC

#pragma mark 懒加载控件
- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线为none
        _tableView.backgroundColor = RGB(250, 250, 250);
    }
    return _tableView;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self requestData];//请求数据
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
    
}

#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - 请求初始数据
- (void)requestData {
    
    //本地请求数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"shoppingCart" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    NSArray *shoppingCarListArray = [MJShoppingCarModel mj_objectArrayWithKeyValuesArray:array];//转模型
    self.dataArray = [NSMutableArray arrayWithArray:shoppingCarListArray];
    
}

#pragma mark - CollectionView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    MJShoppingCarModel *shopModel = (MJShoppingCarModel *)_dataArray[section];
    if(section ==2){
        return 1;
    }else{
        return shopModel.products.count;
    }
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 2){
        
        return [MJScrollerCell getScrollowHeight];
        
    }else{
        return AUTO_MATE_HEIGHT(80);
    }
    
    
    
}

//Cell显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ESWeakSelf;
    if(indexPath.section == 2){
        MJScrollerCell *cell = [MJScrollerCell shoppingCarCellWithTableView:tableView];
        cell.model = (MJShoppingCarModel *)_dataArray[indexPath.section];
        cell.indexPath = indexPath;
        cell.ScrollowImgClick = ^(NSString *productId){
            NSLog(@"----id = %@",productId);
        };
        return cell;
    }else{
        
        MJShoppingCarCell *cell = [MJShoppingCarCell shoppingCarCellWithTableView:tableView];
        MJShoppingCarModel *shopModel = (MJShoppingCarModel *)_dataArray[indexPath.section];
        cell.model = shopModel.products[indexPath.row];
        cell.indexPath = indexPath;
        
        cell.cellImgClick = ^(NSIndexPath *index){
            NSLog(@"回调被点击");
            __weakSelf.tableView.backgroundColor = [UIColor blueColor];
            
        };
         return cell;
    }
    
    
   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"---%ld",indexPath.row);
}

//区头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO_MATE_HEIGHT(50);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MJShoppingCarHeaderView *headerView = [[MJShoppingCarHeaderView alloc] init];
    headerView.shopModel = (MJShoppingCarModel *)_dataArray[section];
    headerView.section = section;
    return headerView;
}



#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
