//
//  YZGShopProduductTableView.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopProduductTableView.h"
#import "YZGShopProductTableviewCell.h"
//#import "YZGShopProductsModel.h"
@interface YZGShopProduductTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation YZGShopProduductTableView
#pragma ******************* init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped])
    {
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[YZGShopProductTableviewCell class] forCellReuseIdentifier:@"shopCell"];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor colorWithHexColorString:@"f9f9f9"];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
- (void)setProducts:(NSArray *)products
{
    _products = products;
    [self reloadData];
}
#pragma ******************* UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.products.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YZGShopProductTableviewCell *showCell = [tableView dequeueReusableCellWithIdentifier:@"shopCell" forIndexPath:indexPath];
    showCell.productModel = self.products[indexPath.section];
    return showCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

#pragma ******************* UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.showProductTableViewDidSelectedCellWithSepId)
    {
//        YZGShopProductsModel *productModel = self.products[indexPath.row];
       // self.showProductTableViewDidSelectedCellWithSepId(productModel.seqid);
    }
}
@end
