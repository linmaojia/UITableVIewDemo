//
//  MyData.h
//  UI-tableView
//
//  Created by ibokan on 16/2/18.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject

@property (nonatomic,strong) NSMutableArray *array; // 每组的数据
@property (nonatomic,strong) NSString * name;  // 组名
@property (nonatomic,assign) BOOL isShow;// 组的状态，yes显示组，no不显示组
@end
