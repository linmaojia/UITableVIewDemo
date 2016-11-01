//
//  MJScrollerCell.h
//  Masonry
//
//  Created by LXY on 16/5/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJShoppingCarModel.h"
@interface MJScrollerCell : UITableViewCell

//内部初始化方法
+ (MJScrollerCell *)shoppingCarCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) MJShoppingCarModel *model;    /**< model */
@property (nonatomic, strong) NSIndexPath *indexPath;    /**< cell的位置 */

@property (nonatomic,strong) void(^ScrollowImgClick)(NSString *productId);

+ (CGFloat)getScrollowHeight;
@end
