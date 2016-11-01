//
//  YZGNewProductCollectionViewCell.h
//  yzg
//
//  Created by EDS on 16/6/3.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YZGCategoryTableModel.h"
@interface YZGNewProductCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) TwoSubsetModel *model;

@end
