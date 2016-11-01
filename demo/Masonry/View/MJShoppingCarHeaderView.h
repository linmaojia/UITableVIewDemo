//
//  MY_ShoppingCarHeaderView.h
//  ShoppingCar
//
//  Created by 麥展毅 on 16/1/16.
//  Copyright © 2016年 麥展毅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJShoppingCarModel.h"
//@class MY_ShopModel;




@protocol SectionHeaderViewDelegate <NSObject>

@optional

//分区头的选择按钮被点击
- (void)shoppingCarHeaderViewSelectButtonClicked:(BOOL)isSelect section:(NSInteger)section;

@end

@interface MJShoppingCarHeaderView : UIView


@property (nonatomic) id <SectionHeaderViewDelegate> delegate; /**< 代理 */

@property (nonatomic, strong) MJShoppingCarModel *shopModel;    /**< 店铺数据 */
@property (nonatomic, assign) NSInteger section;    /**< cell的区位置 */


@property (nonatomic, strong) UIView *lineView;    /**< 分割线 */
@property (nonatomic, strong) UIButton *selectBtn;    /**< 选择按钮 */
@property (nonatomic, strong) UIImageView *titleImg;    /**< 标题图片 */
@property (nonatomic, strong) UILabel *titleLab;    /**< 标题文字 */

@end
