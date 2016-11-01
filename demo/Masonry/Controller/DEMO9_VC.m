//
//  ViewController.m
//  UI_TableVIew
//
//  Created by longma on 16/3/26.
//  Copyright © 2016年 longma. All rights reserved.
//

#import "DEMO9_VC.h"
#import "MyData.h"
@interface DEMO9_VC ()<UITableViewDataSource,UITableViewDelegate>
{
   
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;    /**< 数据数组 */

@end

@implementation DEMO9_VC

#pragma mark 懒加载控件
- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
        
        for (int i=0; i<2; i++) {
            MyData *myData = [[MyData alloc] init];
            myData.array = [[NSMutableArray alloc] initWithCapacity:10];
            myData.name = [NSString stringWithFormat:@"第%d个区",i];
            for (int j=0; j<5; j++) {
                [myData.array addObject:[NSString stringWithFormat:@"%d",j]];
            }
            [_dataArray addObject:myData];
        }
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
- (void) btnClick:(UIButton *)btn
{
    
    MyData *data = [self.dataArray objectAtIndex:btn.tag];
    
    if (data.isShow) {
        
        data.isShow = NO;//改变组的显示状态
        
    }else{
        data.isShow = YES;
    }
    // 刷新点击的组标题，动画使用卡片
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - TableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MyData *data = [self.dataArray objectAtIndex:section];
    //是否展示,默认为no
    if (data.isShow) {
        return  data.array.count;
    }else{
        return  0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    MyData *data = [self.dataArray objectAtIndex:section];
    
    UIView *viewHead=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    viewHead.backgroundColor=RGB(249, 249, 249);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 320, 40);
    [viewHead addSubview:btn];
    [btn setTitle:data.name forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:0];
    btn.tag = section;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //动画button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [viewHead addSubview:button];
    [button setImage:[ UIImage imageNamed: @"4" ] forState:UIControlStateNormal];
    if (data.isShow){
        [UIView animateWithDuration:1.0 animations:^{
            button.transform = CGAffineTransformMakeRotation(M_PI/2);
        } completion:^(BOOL finished) {
            if (finished) {
                //旋转完成后做的事情
                NSLog(@"动画完成");
            }
        }];
    }
    
    
    return viewHead;
}
//头部
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
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
    
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    MyData *data = [self.dataArray objectAtIndex:indexPath.section];
    NSString *str = [[data array] objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    return cell;
    
    
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
