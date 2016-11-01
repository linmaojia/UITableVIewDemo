//
//  ViewController.m
//  UI_TableVIew
//
//  Created by longma on 16/3/26.
//  Copyright © 2016年 longma. All rights reserved.
//

#import "DEMO2_VC.h"
#import "MJSetCell.h"
@interface DEMO2_VC ()<UITableViewDataSource,UITableViewDelegate>
{
   
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;    /**< 数据数组 */

@end

@implementation DEMO2_VC

#pragma mark 懒加载控件
- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray*array1=@[@"账号管理",@"手机号码",@"QQ达人"];
        NSArray*array2=@[@"消息通知",@"聊天记录"];
        NSArray*array3=@[@"联系人，隐私",@"设备锁",@"辅助功能"];
        NSArray*array4=@[@"关于QQ与帮助"];
        [_dataArray addObject:array1];
        [_dataArray addObject:array2];
        [_dataArray addObject:array3];
        [_dataArray addObject:array4];
        
    }
    return _dataArray;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=50;
    }
    return _tableView;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array=self.dataArray[section];
    return array.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *viewHead=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [viewHead addSubview:lab1];
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width, 1)];
    lab1.backgroundColor=[UIColor blackColor];
    lab2.backgroundColor=[UIColor blackColor];
    [viewHead addSubview:lab2];
    if(section==0){
        lab1.hidden=YES;
    }
    
    
    return viewHead;
}
//头部
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

/*
 UITableViewStyleGrouped
 默认会分区的尾部会有空隙  section底部间距
 设置为 0.1 ；
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     MJSetCell *cell = [MJSetCell setCellWithTableView:tableView];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击效果，没有
     NSArray *array=  self.dataArray[indexPath.section];
     cell.titleLab.text=array[indexPath.row];
    
    if(indexPath.row==array.count-1){
        cell.lineView.hidden=YES;
        if(array.count-1==0){
            UIView *viewline=[[UIView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, 1)];
            viewline.backgroundColor=[UIColor blackColor];
            [cell addSubview:viewline];
        }
    }
    
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array=self.dataArray[indexPath.section];
    
    
    NSLog(@"xxx %@",array[indexPath.row]);
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
    // Dispose of any resources that can be recreated.
}

@end
