//
//  MJCollectImgCell.h
//  Masonry
//
//  Created by LXY on 16/5/30.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJShoppingCarModel.h"
@interface MJCollectImgCell : UICollectionViewCell

//内部初始化方法
+ (MJCollectImgCell *)hotProductsCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;


@property (nonatomic, strong) Products *model;    /**< 中间数据 */


@end
