//
//  YZGBrandGuideTableView.h
//  yzg
//
//  Created by EDS on 16/6/2.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZGBrandGuideTableView : UITableView
/*品牌名字头字母数组*/
@property (nonatomic, strong) NSArray *brandNames;
/*选中某一字母回调*/
@property (nonatomic, copy) void (^didSelectedBrandGuideNameWithIndexPath)(NSIndexPath *indexPath);

@end
