//
//  MyShoppingCarCell.h
//  Masonry
//
//  Created by LXY on 16/5/13.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJShoppingCarModel.h"



@interface MJShoppingCarCell : UITableViewCell

//内部初始化方法
+ (MJShoppingCarCell *)shoppingCarCellWithTableView:(UITableView *)tableView;


@property (nonatomic, assign) BOOL selectState;    /**< 选择状态 */
@property (nonatomic, strong) Products *model;    /**< model */
@property (nonatomic, strong) NSIndexPath *indexPath;    /**< cell的位置 */
@property (nonatomic, strong) UIButton *selectBtn;    /**< 选择按钮 */
@property (nonatomic, strong) UIImageView *productImg;    /**< 商品图片 */
@property (nonatomic, strong) UILabel *productNameLab;    /**< 商品名称 */
@property (nonatomic, strong) UILabel *sizeLab;    /**< 商品规格 */
@property (nonatomic, strong) UILabel *costPriceLab;    /**< 商品原价 */
@property (nonatomic, strong) UILabel *currentPriceLab;    /**< 商品现价 */
@property (nonatomic, strong) UILabel *stockLab;    /**< 库存 */
@property (nonatomic, strong) UIView *bottomView;    /**< cell底部的颜色 */

@property(nonatomic, copy)void(^cellImgClick)(NSIndexPath *index);   /**< cell选中按钮点击回调 */




@end
