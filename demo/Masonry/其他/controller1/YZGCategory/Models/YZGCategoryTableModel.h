//
//  YZGCategoryTableModel.h
//  Masonry
//
//  Created by LXY on 16/7/22.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OneSubsetModel,TwoSubsetModel;

@interface YZGCategoryTableModel : NSObject



@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSArray<OneSubsetModel *> *subset;

@property (nonatomic, assign) BOOL isSelect;


@end



@interface OneSubsetModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSArray<TwoSubsetModel *> *subset;

@end



@interface TwoSubsetModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *picUri;



@end