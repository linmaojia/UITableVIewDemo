//
//  NextController.m
//  Masonry
//
//  Created by LXY on 16/7/22.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "NextController.h"
#import "YZGCategoryTableModel.h"
#import "YZGCategoryCollectionView.h"
@interface NextController ()<UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>
{
 
}
@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) YZGCategoryCollectionView  *categoryCollectionView; /* 右边collectionView*/

@end

@implementation NextController
- (YZGCategoryCollectionView *)categoryCollectionView
{
    if (_categoryCollectionView == nil)
    {
        CGFloat cellWidth = (self.view.frame.size.width - 80)/3;
        CGFloat cellHeight = AUTO_MATE_HEIGHT(100);
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSizeMake(cellWidth, cellHeight);//cell的大小
        _categoryCollectionView = [[YZGCategoryCollectionView alloc] initWithFrame:CGRectMake(80, 0, SCREEN_WIDTH-80, SCREEN_HEIGHT-64) collectionViewLayout:layout];
        _categoryCollectionView.backgroundColor = [UIColor whiteColor];
        _categoryCollectionView.contentInset = UIEdgeInsetsMake(73, 0, 0, 0);//对于整个UICollectView
        
        //[_categoryCollectionView addSubview:self.topView];
        
        _categoryCollectionView.didClick = ^(NSString *title){
            
            [SVProgressHUD showErrorWithStatus:title];
        };
        
    }
    return _categoryCollectionView;
}
- (UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT- 64)];
        [_bgView setBackgroundColor:RGBA(0, 0, 0, 0.3)];
        _bgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_bgView addGestureRecognizer:tap];//添加手势
        tap.delegate = self;
        
     

    }
    return _bgView;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
  
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];//控件布局
    self.view.backgroundColor = [UIColor grayColor];
}

//屏蔽父视图的手势问题
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:self.categoryCollectionView]) {
        return NO;
    }
    return YES;
}
#pragma mark - CollectionView 代理方法
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
    
}
//Cell显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; //选中cell时无色
    YZGCategoryTableModel *model = _dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithRed:0.540  green:0.564  blue:0.589 alpha:1];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"---%ld",indexPath.row);
    
    
     [self.view addSubview:self.bgView];
     [self.bgView addSubview:self.categoryCollectionView];
    
    YZGCategoryTableModel *model = _dataArray[indexPath.row];
    _categoryCollectionView.Model = model;
    
    [self show];
    
    NSLog(@"%@",self.view.subviews);
    
}
#pragma mark ************** 判断点击了哪个视图
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    if ([touch.view isKindOfClass:self.bgView]) {
//        
//    }
//}
#pragma mark ************** 显示
- (void)show {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        CGRect frame = _bgView.frame;
        frame.origin.x -= frame.size.width;
        _bgView.frame = frame;
        
    } completion:nil];
 
}
#pragma mark ************** 消失
- (void)dismiss {
    [UIView animateWithDuration:0.4f  animations:^{
        
        CGRect frame = _bgView.frame;
        frame.origin.x += frame.size.width;
        _bgView.frame = frame;
        
    } completion:^(BOOL finished) {
        
       // [_View removeFromSuperview];
    }];
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
