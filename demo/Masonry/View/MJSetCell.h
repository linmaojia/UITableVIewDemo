//
//  MJSetCell.h
//  Masonry
//
//  Created by LXY on 16/5/20.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJSetCell : UITableViewCell

@property (nonatomic, strong) UIView *lineView;    /**< 线 */
@property (nonatomic, strong) UILabel *titleLab;    /**< 标题 */
//内部初始化方法
+ (MJSetCell *)setCellWithTableView:(UITableView *)tableView;

@end
