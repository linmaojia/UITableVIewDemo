//
//  MyShoppingCarController.m
//  Masonry
//
//  Created by LXY on 16/5/13.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO1_VC.h"
#import "MJShoppingCarCell.h"
#import "MJShoppingCarModel.h"
#import "MJShoppingCarHeaderView.h"
@interface DEMO1_VC ()<UITableViewDelegate, UITableViewDataSource>
{
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSMutableArray *dataArray;    /**< 数据数组 */
@end

@implementation DEMO1_VC

#pragma mark 懒加载控件
- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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
    return shopModel.products.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO_MATE_HEIGHT(80);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MJShoppingCarCell *cell = [MJShoppingCarCell shoppingCarCellWithTableView:tableView];
    MJShoppingCarModel *shopModel = (MJShoppingCarModel *)_dataArray[indexPath.section];
    cell.model = shopModel.products[indexPath.row];
    cell.indexPath = indexPath;
    
    
    ESWeakSelf; //防止self在block中造成循环引用
    //cell的图片点击回调
    cell.cellImgClick = ^(NSIndexPath *index){
        NSLog(@"回调被点击");
        __weakSelf.tableView.backgroundColor = [UIColor blueColor];
        
    };
    
    return cell;
    
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

//----------ios8要添加此方法，不然真机不能左滑-------------   添加删除效果
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESWeakSelf;
    //删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        
        [__weakSelf DeleteProductWithIndexPath:indexPath];//要先删除原数据
    }];
    //收藏按钮
    UITableViewRowAction *otherRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        
    }];
    
    otherRowAction.backgroundColor = [UIColor orangeColor];
    //返回按钮数组
    return @[deleteRowAction, otherRowAction];
}

//删除某个商品
- (void)DeleteProductWithIndexPath:(NSIndexPath *)indexPath {
    
    MJShoppingCarModel *shopModel = (MJShoppingCarModel *)_dataArray[indexPath.section];
    [shopModel.products removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}



#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);//等同于父视图
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
