//
//  YZGShopAdressModel.h
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YZGShopAdressModel : NSObject
@property (nonatomic, copy) NSString *merCompany;
@property (nonatomic, copy) NSString *merAddress;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, copy) NSString *merMobile1;
@property (nonatomic, copy) NSString *merTrueName;
@property (nonatomic, strong) NSArray *serversArr;
+ (instancetype)shopAdressModelWithDict:(NSDictionary *)dict;
@end
