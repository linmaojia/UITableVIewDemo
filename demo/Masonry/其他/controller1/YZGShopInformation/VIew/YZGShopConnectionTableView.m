//
//  YZGShopConnectionTableView.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopConnectionTableView.h"
#import "YZGShopBrandAdressCell.h"
#import "YZGShopPhoneTableViewCell.h"
#import "YZGShopConnectionHeaderView.h"
#import "YZGShopServiceListModel.h"
#import "YZGShopAdressModel.h"
#import "YZGShopServersModel.h"
@interface YZGShopConnectionTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YZGShopConnectionTableView
#pragma ******************* init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped])
    {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[YZGShopBrandAdressCell class] forCellReuseIdentifier:@"brandCell"];
        [self registerClass:[YZGShopPhoneTableViewCell class] forCellReuseIdentifier:@"phoneCell"];
        [self registerClass:[YZGShopConnectionHeaderView class] forHeaderFooterViewReuseIdentifier:@"connectionHeader"];
        self.backgroundColor = [UIColor colorWithWhite:237/255.0 alpha:1.0];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
#pragma mark **************** 重写setter方法
- (void)setServiceListModel:(YZGShopServiceListModel *)serviceListModel
{
    _serviceListModel = serviceListModel;
    [self reloadData];
}
#pragma ******************* UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.serviceListModel.serversArr.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        YZGShopPhoneTableViewCell *phoneCell = [tableView dequeueReusableCellWithIdentifier:@"phoneCell" forIndexPath:indexPath];
        phoneCell.indexPath = indexPath;
        phoneCell.serversModel = self.serviceListModel.serversArr[indexPath.row];
        phoneCell.serversModel.brandFaxForSales = self.serviceListModel.brandFaxForSales;
        return phoneCell;
    }else
    {
        YZGShopBrandAdressCell *brandCell = [tableView dequeueReusableCellWithIdentifier:@"brandCell" forIndexPath:indexPath];
        brandCell.indexPath = indexPath;
        brandCell.adressModel = self.serviceListModel.adressModel;
        return brandCell;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YZGShopConnectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"connectionHeader"];
    if (headerView == nil)
    {
        headerView = [[YZGShopConnectionHeaderView alloc] initWithReuseIdentifier:@"connectionHeader"];
    }
    headerView.sectionTitle = @"  品牌地址";
    if (section == 0)
    {
        headerView.sectionTitle = @"  联系客服";
    }
    headerView.section = section;
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 180;
    }else
    {
        return 110;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 50;
    }else
    {
        return 30;
    }
}
@end
