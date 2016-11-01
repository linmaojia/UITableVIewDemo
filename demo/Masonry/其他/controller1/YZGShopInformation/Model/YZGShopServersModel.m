//
//  YZGShopServersModel.m
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGShopServersModel.h"

@implementation YZGShopServersModel
+ (instancetype)shopServersModelWithDict:(NSDictionary *)dict
{
    return [[YZGShopServersModel alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
//避免出现键值对不匹配导致崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
