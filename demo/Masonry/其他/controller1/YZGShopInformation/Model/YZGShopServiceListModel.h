//
//  YZGShopServiceListModel.h
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YZGShopAdressModel;

@interface YZGShopServiceListModel : NSObject
@property (nonatomic, strong) NSArray *serversArr;


@property (nonatomic, strong) YZGShopAdressModel *adressModel;
@property (nonatomic, copy) NSString *brandFaxForSales;
+ (instancetype)shopServiceListModelWithDict:(NSDictionary *)dict;
@end
