//
//  YZGCategoryTableModel.m
//  Masonry
//
//  Created by LXY on 16/7/22.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGCategoryTableModel.h"


@implementation YZGCategoryTableModel

+ (NSDictionary *)objectClassInArray{
    return @{@"subset" : [OneSubsetModel class]};
}

@end


@implementation OneSubsetModel

+ (NSDictionary *)objectClassInArray{
    return @{@"subset" : [TwoSubsetModel class]};
}

@end

@implementation TwoSubsetModel

@end