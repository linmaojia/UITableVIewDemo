//
//  ViewController.m
//  Masonry
//
//  Created by LXY on 16/4/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
#import "DEMO1_VC.h"
#import "DEMO2_VC.h"
#import "DEMO3_VC.h"
#import "DEMO4_VC.h"
#import "DEMO5_VC.h"
#import "DEMO6_VC.h"
#import "DEMO7_VC.h"
#import "DEMO8_VC.h"
#import "DEMO9_VC.h"
#import "DEMO10_VC.h"
#import "DEMO11_VC.h"
#import "DEMO12_VC.h"
#import "DEMO13_VC.h"
#import "DEMO14_VC.h"
#import "DEMO15_VC.h"
#import "DEMO16_VC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSArray *nameArray;    /**< 名称数组 */
@property (nonatomic, strong) NSArray *classArray;    /**< 类名数组 */
@end

@implementation ViewController

#pragma mark 懒加载控件
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
      
    }
    return _tableView;
}

- (NSArray *)nameArray {
    
    if (!_nameArray) {
        _nameArray = @[@"Table-分区-左滑删除-1",@"Table-个人设置-Grouped-2",@"清除缓存SDWebImage-3",@"Scrollow里面放Table-4",@"Table-下拉背景拉长-5",@"Table-下拉背景变大-6",@"Table-下拉背景，头像变大-7",@"Table里面放Scrollow-8",@"点击Section 弹出cell-9",@"Table里面放-Collection-10",@"TableCell-增加-移动-11",@"TableCell-圆圈多选-12",@"TableCell-置顶-13",@"Table-分割线不留空白-14",@"Table-多个视图切换-店铺-15",@"Table-分类-16"];
       
    }
    return _nameArray;
}
- (NSArray *)classArray {
    if (!_classArray) {
        _classArray = @[[DEMO1_VC class],[DEMO2_VC class],[DEMO3_VC class],[DEMO4_VC class],[DEMO5_VC class]
                        ,[DEMO6_VC class],[DEMO7_VC class],[DEMO8_VC class],[DEMO9_VC class],[DEMO10_VC class],[DEMO11_VC class],[DEMO12_VC class],[DEMO13_VC class],[DEMO14_VC class],[DEMO15_VC class],[DEMO16_VC class]];
        
    }
    return _classArray;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
}

#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"UITableView";
    
}


#pragma mark- tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO_MATE_HEIGHT(50);
    
}
//系统cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; //选中cell时无色
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithRed:0.540  green:0.564  blue:0.589 alpha:1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"DEMO%ld",(long)indexPath.row+1 ];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RootViewController *vc = [[self.classArray[indexPath.row] alloc] init];
    
    vc.titleStr = self.nameArray[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.tableView];
    
   
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //设置tableView的边缘==父视图
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
