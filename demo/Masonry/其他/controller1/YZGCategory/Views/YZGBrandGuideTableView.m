//
//  YZGBrandGuideTableView.m
//  yzg
//
//  Created by EDS on 16/6/2.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGBrandGuideTableView.h"
#import "YZGCategoryTableModel.h"

@interface YZGBrandGuideTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YZGBrandGuideTableView
#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
       //[self registerClass:[YZGBrandTableViewCell class] forCellReuseIdentifier:@"brandGuideCell"];
        self.alpha = 0.7;
    }
    return self;
}
#pragma mark **************** 重写setter方法
- (void)setBrandNames:(NSArray *)brandNames
{
    _brandNames = brandNames;
    [self reloadData];
}
#pragma mark **************** UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.brandNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YZGBrandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"brandGuideCell" forIndexPath:indexPath];
//    YZGCategorySecondLayerModel *secondModel = self.brandNames[indexPath.row];
//    cell.celltitle = secondModel.name;
//    return cell;
    
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    OneSubsetModel *oneSubsetModel = self.brandNames[indexPath.row];
    cell.textLabel.text = oneSubsetModel.name;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = RGBA(0, 0, 0, 0.5);
    return cell;
}

#pragma mark **************** UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectedBrandGuideNameWithIndexPath)
    {
        self.didSelectedBrandGuideNameWithIndexPath(indexPath);
    }    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return AUTO_MATE_HEIGHT(37);
}

@end
