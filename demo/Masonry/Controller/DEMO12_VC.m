//
//  ViewController.m
//  Masonry
//
//  Created by LXY on 16/4/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//
/*
 
 点击选中的背景颜色不要设置为蓝色
 */

#import "DEMO12_VC.h"
#import "MJSimCell.h"

#define cellIdentifier @"cellIdentifier"

@interface DEMO12_VC ()<UITableViewDelegate, UITableViewDataSource>
{
    UIButton *rightButton;
    NSMutableDictionary *deleteDic;
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSMutableArray *nameArray;    /**< 名称数组 */
@property (nonatomic, strong) NSMutableArray *selectArray;    /**< 选中数组 */

@end

@implementation DEMO12_VC

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

- (NSMutableArray *)nameArray {
    
    if (!_nameArray) {
        _nameArray = [NSMutableArray array];
        for(int i = 0; i < 10; i++)
        {
            [_nameArray addObject:[NSString stringWithFormat:@"我是第%d",i]];
        }
    }
    return _nameArray;
}
- (NSMutableArray *)selectArray {
    
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
       
    }
    return _selectArray;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
    
   
}

#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"UITableView";
    
    //导航栏右边button
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked:)];
    self.navigationItem.rightBarButtonItem = item;
    
}
//编辑cell
- (void)rightBarButtonItemClicked:(id *)sender {
    
   [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if (self.tableView.editing)
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"删除"];//cell可编辑状态右导航切换主题
        
    }
    else
    {
      //点击了删除
       [self.navigationItem.rightBarButtonItem setTitle:@"编辑"];  //进入不可编辑转态，就是还原了
        
        if (self.selectArray.count>0)
        {
        
            [self.nameArray removeObjectsInArray:self.selectArray];
            [self.selectArray removeAllObjects];
            [self.tableView reloadData];
        }
    }
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

    /*
     这里有个坑，就是不能设置cell 的选中状态为none,不然看不到选中效果
     */
    
    MJSimCell *cell = [MJSimCell shoppingCarCellWithTableView:tableView];
    cell.name = self.nameArray[indexPath.row];
    

    return cell;
    
}
//选择状态的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"点击了");
    [self.selectArray addObject:self.nameArray[indexPath.row]];
}
//取消选择状态的方法
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"点击了xxxx%ld",indexPath.row);
    [self.selectArray removeObject:self.nameArray[indexPath.row]];
}

#pragma mark - 编辑cell
//cell左边显示圆圈多选
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //如果编辑状态
    if (self.tableView.editing)
    {
        
    return UITableViewCellEditingStyleDelete |UITableViewCellEditingStyleInsert;
        
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    
}
//cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//----------ios8要添加此方法，不然真机不能左滑-------------   添加删除效果
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESWeakSelf;
    //删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        [__weakSelf.nameArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
 
    //返回按钮数组
    return @[deleteRowAction];
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
