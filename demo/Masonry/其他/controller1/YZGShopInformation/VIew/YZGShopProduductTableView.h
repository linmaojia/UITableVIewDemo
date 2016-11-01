//
//  YZGShopProduductTableView.h
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZGShopProduductTableView : UITableView
@property (nonatomic, copy) void (^showProductTableViewDidSelectedCellWithSepId)(NSString *SepId);
@property (nonatomic, strong) NSArray *products;
@end
