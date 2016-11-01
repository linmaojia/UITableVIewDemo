//
//  YZGCategoryCollectionView.h
//  Masonry
//
//  Created by LXY on 16/7/22.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YZGCategoryTableModel.h"

@interface YZGCategoryCollectionView : UICollectionView

@property (nonatomic, strong) YZGCategoryTableModel *Model;    /**< 右边数据数组 */

@property (nonatomic, copy) void (^didClick)(NSString *idss);

@end
