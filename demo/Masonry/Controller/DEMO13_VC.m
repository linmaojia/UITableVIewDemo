//
//  ViewController.m
//  Masonry
//
//  Created by LXY on 16/4/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO13_VC.h"
#import "MJSimCell.h"
@interface DEMO13_VC ()<UITableViewDelegate, UITableViewDataSource>
{
    UIButton *rightButton;
    NSMutableDictionary *deleteDic;
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) NSMutableArray *nameArray;    /**< 名称数组 */
@end

@implementation DEMO13_VC

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

#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];//设置导航栏
    [self layoutSubviews];//控件布局
    deleteDic = [[ NSMutableDictionary alloc ] init ];
    
   
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

    MJSimCell *cell = [MJSimCell shoppingCarCellWithTableView:tableView];
    cell.name = self.nameArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"点击了");
}

#pragma mark - 编辑cell
//设置cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESWeakSelf;
    //置顶按钮
    UITableViewRowAction *otherRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath){
        
        /*
         没有动画效果
         
         [__weakSelf.nameArray insertObject:__weakSelf.nameArray[indexPath.row] atIndex:0];
         [__weakSelf.nameArray removeObjectAtIndex:indexPath.row+1];
         [__weakSelf.tableView reloadData];
         
         */
        
        //动画效果
        NSIndexPath *first = [NSIndexPath indexPathForRow:0 inSection:0];
        [__weakSelf.tableView moveRowAtIndexPath:indexPath toIndexPath:first];
        [__weakSelf.nameArray insertObject:__weakSelf.nameArray[indexPath.row] atIndex:0];
        [__weakSelf.nameArray removeObjectAtIndex:indexPath.row+1];
        __weakSelf.tableView.editing=NO;
        
        
    }];
    otherRowAction.backgroundColor = [UIColor grayColor];
    //返回按钮数组
    return @[otherRowAction];
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
