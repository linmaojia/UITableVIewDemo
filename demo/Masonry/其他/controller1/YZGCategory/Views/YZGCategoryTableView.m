//
//  YZGCategoryTableView.m
//  yzg
//
//  Created by EDS on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGCategoryTableView.h"
#import "YZGCategoryTableModel.h"
@interface YZGCategoryTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YZGCategoryTableView
#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.dataSource = self;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"categoryCell"];

       
    }
    return self;
}
#pragma mark **************** 重写setter方法
- (void)setCategoryList:(NSArray *)categoryList
{
    _categoryList = categoryList;
    
    YZGCategoryTableModel *model = _categoryList[0];
    model.isSelect = YES;
    
    [self reloadData];
    
    
  
}
#pragma mark **************** UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoryList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    YZGCategoryTableModel *model = _categoryList[indexPath.row];
    cell.textLabel.text = model.name;
    
    if(model.isSelect)
    {
       cell.backgroundColor = [UIColor grayColor];
    }
    else
    {
      cell.backgroundColor = [UIColor whiteColor];

    }
    
  
    return cell;
}
#pragma mark **************** UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for(int i = 0;i<_categoryList.count;i++)
    {
        YZGCategoryTableModel *model = _categoryList[i];
         model.isSelect = NO;
    }
    YZGCategoryTableModel *model = _categoryList[indexPath.row];
    model.isSelect = YES;
    
    
    [tableView reloadData];
    self.categoryListSelectedIndexPath(indexPath);

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
