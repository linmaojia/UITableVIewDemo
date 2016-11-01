//
//  ViewController.m
//  UI_TableVIew
//
//  Created by longma on 16/3/26.
//  Copyright © 2016年 longma. All rights reserved.
//

#import "DEMO16_VC.h"
#import "YZGCategoryTableView.h"
#import "YZGCategoryTableModel.h"
#import "NextController.h"
#import "YZGCategoryCollectionView.h"
#import "YZGBrandGuideTableView.h"
@interface DEMO16_VC ()
{
   
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *categoryArray;    /**< 左边数据数组 */

@property (nonatomic, strong) YZGCategoryTableModel *rightModel;    /**< 右边数据数组 */


@property (nonatomic, strong) YZGCategoryTableView  *categoryTableView; /*分类tableView*/

@property (nonatomic, strong) YZGCategoryCollectionView  *categoryCollectionView; /* 右边collectionView*/


@property (nonatomic, strong) YZGBrandGuideTableView *brandGuideTableView;/*右边的品牌字母搜索tableview*/

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) NextController  *nextController;
@property (nonatomic, strong) UIButton *topView;      /**< 顶部图片 */

@end

@implementation DEMO16_VC

#pragma mark 懒加载控件
- (YZGBrandGuideTableView *)brandGuideTableView
{
    if (_brandGuideTableView == nil)
    {
        ESWeakSelf
        _brandGuideTableView = [[YZGBrandGuideTableView alloc] init];
        _brandGuideTableView.hidden = YES;
        _brandGuideTableView.didSelectedBrandGuideNameWithIndexPath = ^(NSIndexPath *indexPath){
            [__weakSelf.categoryCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        };
    }
    return _brandGuideTableView;
    
    
}
- (NextController *)nextController
{
    if (_nextController == nil)
    {
        _nextController = [[NextController alloc] init];
        _nextController.view.frame = [UIScreen mainScreen].bounds;
    }
    return _nextController;
}
- (NSMutableArray *)categoryArray
{
    if (_categoryArray == nil)
    {
        _categoryArray = [NSMutableArray array];
        
        NSString*plistPath = [[NSBundle mainBundle]pathForResource:@"prograr"ofType:@"plist"];
        
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        
        _categoryArray = [NSMutableArray arrayWithArray:dic[@"shop"]];
        
        NSLog(@"%@",_categoryArray);
        _categoryArray = [YZGCategoryTableModel mj_objectArrayWithKeyValuesArray:_categoryArray];
        
        
      
    }
    return _categoryArray;
}
- (YZGCategoryTableView *)categoryTableView
{
    if (_categoryTableView == nil)
    {
        _categoryTableView = [[YZGCategoryTableView alloc] init];
        _categoryTableView.backgroundColor = [UIColor whiteColor];
        ESWeakSelf;
        _categoryTableView.categoryListSelectedIndexPath = ^(NSIndexPath *indexPath){
            NSLog(@"%ld",indexPath.row);
            
            YZGCategoryTableModel *model = __weakSelf.categoryArray[indexPath.row];
             __weakSelf.categoryCollectionView.Model = model;
            
            //判断是否显示品牌字母
            if([model.name isEqualToString:@"品牌"])
            {
                __weakSelf.brandGuideTableView.hidden = NO;
                __weakSelf.brandGuideTableView.brandNames = model.subset;
            }
            else
            {
              __weakSelf.brandGuideTableView.hidden = YES;
            }
        };
        
    }
    return _categoryTableView;
}
- (UIButton *)topView
{
    if (!_topView)
    {
        _topView = [UIButton buttonWithType:UIButtonTypeCustom];
        _topView.frame = CGRectMake(0, -73, self.view.frame.size.width - 80, 73);
        [_topView setBackgroundImage:[UIImage imageNamed:@"banner"] forState:0];
        _topView.backgroundColor = [UIColor yellowColor];
    }
    return _topView;
    
}

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
        _categoryCollectionView = [[YZGCategoryCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _categoryCollectionView.backgroundColor = [UIColor whiteColor];
         _categoryCollectionView.contentInset = UIEdgeInsetsMake(73, 0, 0, 0);//对于整个UICollectView
        
         [_categoryCollectionView addSubview:self.topView];
        
        _categoryCollectionView.didClick = ^(NSString *title){
            
            [SVProgressHUD showErrorWithStatus:title];
        };
        
    }
    return _categoryCollectionView;
}
- (UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil)
    {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"分类检索",@"组合筛选"]];
        [_segmentedControl addTarget:self action:@selector(segmentedDidAction:) forControlEvents:UIControlEventValueChanged];
        [_segmentedControl setWidth:AUTO_MATE_WIDTH(80) forSegmentAtIndex:0];
        [_segmentedControl setWidth:AUTO_MATE_WIDTH(80) forSegmentAtIndex:1];
        
        _segmentedControl.layer.cornerRadius = self.segmentedControl.frame.size.height/2;
        _segmentedControl.clipsToBounds = YES;
        _segmentedControl.layer.borderColor = [UIColor whiteColor].CGColor;
        _segmentedControl.layer.borderWidth = 1.5;
    }
    return _segmentedControl;
    
}
#pragma mark **************** 点击分类检索、组合筛选触发方法
- (void)segmentedDidAction:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 1)
    {
        [self.view addSubview:self.nextController.view];
        self.nextController.dataArray = self.categoryArray;
        
    }else
    {
        [self.nextController.view removeFromSuperview];
    }
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}
#pragma mark - 设置导航栏
- (void)setNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.segmentedControl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];//设置导航栏
    [self addSubViewsForCategoryView];
    [self layoutSubviews];//控件布局
    
    
    //请求数据
    _categoryTableView.categoryList = self.categoryArray;
    _categoryCollectionView.Model = self.categoryArray[0];
  
   
}
#pragma mark **************** 添加子控件
- (void)addSubViewsForCategoryView
{
    [self.view addSubview:self.categoryTableView];
    [self.view addSubview:self.categoryCollectionView];
    [self.view addSubview:self.brandGuideTableView];

}
#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [_categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.view);
        make.width.equalTo(@80);
    }];
    [_categoryCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.view);
        make.left.equalTo(_categoryTableView.right);
        make.right.equalTo(self.view);
    }];
    
    [_brandGuideTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.trailing.top.equalTo(self.view);
        make.width.equalTo(@30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
