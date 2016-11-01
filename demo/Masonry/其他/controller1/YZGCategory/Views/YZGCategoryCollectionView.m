//
//  YZGCategoryCollectionView.m
//  Masonry
//
//  Created by LXY on 16/7/22.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGCategoryCollectionView.h"
#import "YZGNewProductCollectionViewCell.h"
#import "YZGProductHeaderView.h"
static NSString * const reuseIdentifier = @"Cell";
@interface YZGCategoryCollectionView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation YZGCategoryCollectionView

- (NSArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{

    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = RGB(247, 249, 250);
        [self registerClass:[YZGNewProductCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self registerClass:[YZGProductHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
       
        
    }
    return self;
}
- (void)setModel:(YZGCategoryTableModel *)Model{
    _Model = Model;
    
    self.dataArray = Model.subset;
    [self reloadData];
    
}

#pragma mark **************** <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    OneSubsetModel *Model = self.dataArray[section];
    
    return Model.subset.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YZGNewProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
     cell.indexPath = indexPath;
    
    OneSubsetModel *Model = self.dataArray[indexPath.section];
    cell.model = Model.subset[indexPath.row];
    
    NSLog(@"---%ld",indexPath.row);
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader ){
        
       YZGProductHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        OneSubsetModel *OneSubsetModel = self.dataArray[indexPath.section];
        headerView.sectionTitle = OneSubsetModel.name;
        headerView.oneTitle = _Model.name;
     
        reusableview = headerView;
    }
    
    return reusableview;
}
//定义headView的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.frame.size.width, 30);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    OneSubsetModel *Model = self.dataArray[indexPath.section];
    TwoSubsetModel *twoModel = Model.subset[indexPath.row];
    
    self.didClick(twoModel.name);
   NSLog(@"--xxxxxxxx-%ld",indexPath.row);
    
}

@end
