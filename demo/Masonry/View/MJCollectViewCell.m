//
//  MJScrollerCell.m
//  Masonry
//
//  Created by LXY on 16/5/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJCollectViewCell.h"
#import "MJCollectImgCell.h"

#define CollectionView_H AUTO_MATE_WIDTH(100)
@interface MJCollectViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *hotCollectionView;    /**< 中间横向视图 */
@property (nonatomic, strong) NSMutableArray *DataArray;    /**< 中间视图数组 */
@end
@implementation MJCollectViewCell

#pragma mark 懒加载控件
- (UICollectionView *)hotCollectionView {
    if (!_hotCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //上 左 下 右 的距离(整个collection)不包括cell与cell 的距离
        layout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
        layout.minimumInteritemSpacing = 10;//列与列之间的间距
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平滑动
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-30)/2, AUTO_MATE_HEIGHT(80));//cell的大小
        _hotCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _hotCollectionView.delegate = self;
        _hotCollectionView.dataSource = self;
        _hotCollectionView.backgroundColor = RGB(247, 249, 250);
        [_hotCollectionView registerClass:[MJCollectImgCell class] forCellWithReuseIdentifier:NSStringFromClass([MJCollectImgCell class])];//注册cell
        
    }
    return _hotCollectionView;
}
- (NSMutableArray *)DataArray {
    if (!_DataArray) {
        _DataArray = [NSMutableArray array];
    }
    return _DataArray;
}
+ (CGFloat)getScrollowHeight{
    return CollectionView_H;
}
#pragma mark  - 内部初始化方法
+ (MJCollectViewCell *)shoppingCarCellWithTableView:(UITableView *)tableView {
    
    MJCollectViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[MJCollectViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = hexColor(FAFAFA);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.hotCollectionView];
       
        
    }
    return self;
}

- (void)setModel:(MJShoppingCarModel *)model {
    _model = model;
    
    _DataArray =  _model.products;
    [self.hotCollectionView reloadData];
    
}

#pragma mark - CollectionView 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.DataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJCollectImgCell *cell = [MJCollectImgCell hotProductsCellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.model = _DataArray[indexPath.row];
  
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld被点击",indexPath.row);
     Products *product = _DataArray[indexPath.row];
     self.CollectionImgClick(product.productId);
    
}


- (void)layoutSubviews {
    [super layoutSubviews];

    [_hotCollectionView makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.contentView);
    }];

}
@end
