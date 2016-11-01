//
//  YZGShopServersModel.h
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZGShopServersModel : NSObject
@property (nonatomic, copy) NSString *cserversName;
@property (nonatomic, copy) NSString *cserversHeadPic;
@property (nonatomic, copy) NSString *cserversMPhone;
@property (nonatomic, copy) NSString *cserversTel;
@property (nonatomic, copy) NSString *cserversICQ;
@property (nonatomic, copy) NSString *brandFaxForSales;
@property (nonatomic, copy) NSString *cserversWeiXin;
@property (nonatomic, copy) NSString *cserversWeiXinQRCode;
+ (instancetype)shopServersModelWithDict:(NSDictionary *)dict;
@end
