//
//  MY_ShoppingCarModel.h
//  ETao
//
//  Created by AVGD－Mai on 16/3/1.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Products;
@interface MJShoppingCarModel : NSObject

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic, strong) NSMutableArray<Products *> *products;

@property (nonatomic, copy) NSString *brandName;

@property (nonatomic) BOOL select;

@end

@interface Products : NSObject

@property (nonatomic, copy) NSString *productId;

@property (nonatomic, copy) NSString *productNum;

@property (nonatomic, copy) NSString *productType;

@property (nonatomic, copy) NSString *cartId;

@property (nonatomic, copy) NSString *specLength;

@property (nonatomic, strong) NSString *productName;

@property (nonatomic, strong) NSString *brandPicUri;

@property (nonatomic, assign) CGFloat originPrice;

@property (nonatomic, strong) NSArray *productDetailPicUirs;

@property (nonatomic, assign) CGFloat productPrice;

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic, copy) NSString *productPicUri;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) NSInteger productQty;

@property (nonatomic, copy) NSString *specWidth;

@property (nonatomic, copy) NSString *brandName;

@property (nonatomic, copy) NSString *specHeight;

@property (nonatomic, assign) int productStocks;    /**< <#name#> */

@property (nonatomic, assign) int authentic;    /**< <#name#> */

@property (nonatomic) BOOL select;

@end

