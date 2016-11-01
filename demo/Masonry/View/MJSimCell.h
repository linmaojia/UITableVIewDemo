//
//  MJScrollerCell.h
//  Masonry
//
//  Created by LXY on 16/5/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MJSimCell : UITableViewCell

//内部初始化方法
+ (MJSimCell *)shoppingCarCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) NSString *name;

@end
