//
//  YZGShopConnectionTableView.h
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZGShopServiceListModel;
@interface YZGShopConnectionTableView : UITableView
@property (nonatomic, strong) YZGShopServiceListModel *serviceListModel;
@end
