//
//  YZGProductHeaderView.h
//  yzg
//
//  Created by EDS on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZGProductHeaderView : UICollectionReusableView
/*点击排行榜触发*/
@property (nonatomic, copy) void (^popularListButtonDidClick)(NSInteger section);
@property (nonatomic, strong) NSString *sectionTitle; /*组名*/
@property (nonatomic, assign) NSInteger section;

@property (nonatomic, strong) NSString *oneTitle; /* 大组名*/

@end
