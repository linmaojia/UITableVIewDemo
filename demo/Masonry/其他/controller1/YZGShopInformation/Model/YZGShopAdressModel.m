//
//  YZGShopAdressModel.m
//  yzg
//
//  Created by EDS on 16/6/16.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGShopAdressModel.h"
#import "YZGShopServersModel.h"
@implementation YZGShopAdressModel
+ (instancetype)shopAdressModelWithDict:(NSDictionary *)dict
{
    return [[YZGShopAdressModel alloc] initWithDict:dict];
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
        NSArray *arr = (NSArray *)value;
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dict in arr)
        {
            [mArr addObject:[YZGShopServersModel shopServersModelWithDict:dict]];
        }
        self.serversArr = [mArr copy];
    }

}

@end
