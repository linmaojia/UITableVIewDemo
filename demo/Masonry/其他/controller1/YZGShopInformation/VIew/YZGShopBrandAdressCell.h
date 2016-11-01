//
//  YZGShopBrandAdressCell.h
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZGShopAdressModel;
@interface YZGShopBrandAdressCell : UITableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) YZGShopAdressModel *adressModel;
@end
