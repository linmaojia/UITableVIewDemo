//
//  YZGShopServiceListModel.m
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGShopServiceListModel.h"
#import "YZGShopServersModel.h"

@implementation YZGShopServiceListModel
+ (instancetype)shopServiceListModelWithDict:(NSDictionary *)dict
{
    return [[YZGShopServiceListModel alloc] initWithDict:dict];
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
    if ([key isEqualToString:@"ezgCservers"])
    {
        NSArray *serverArr = (NSArray *)value;
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dict in serverArr)
        {
            [mArr addObject:[YZGShopServersModel shopServersModelWithDict:dict]];
        }
        self.serversArr = [mArr copy];
    }
}

@end
