//
//  YZGCategoryTableView.h
//  yzg
//
//  Created by EDS on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZGCategoryTableView : UITableView
/*左侧的分类数据*/
@property (nonatomic, strong) NSArray *categoryList;
@property (nonatomic, copy) void (^categoryListSelectedIndexPath)(NSIndexPath *indexPath);
@end
