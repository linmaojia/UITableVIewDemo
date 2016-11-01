//
//  MJScrollerCell.m
//  Masonry
//
//  Created by LXY on 16/5/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//
/**

 
 
 */

#import "MJSimCell.h"
@interface MJSimCell()
@property (nonatomic, strong) UILabel *lab;

@end
@implementation MJSimCell

- (UILabel *)lab {
    if (!_lab) {
        _lab = [[UILabel alloc] init];
        _lab.textColor = [UIColor blackColor];
        
    }
    return _lab;
}
#pragma mark  - 内部初始化方法
+ (MJSimCell *)shoppingCarCellWithTableView:(UITableView *)tableView {
    
    MJSimCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[MJSimCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.tintColor = [UIColor redColor];//这是按钮选中的颜色，默认为蓝色
        
        /**
         这是按钮选中时所在视图的背景颜色
         
         UIView *view = [[UIView alloc]init];
         view.backgroundColor = [UIColor grayColor];
         self.selectedBackgroundView = view;
         
         */
        
        [self.contentView addSubview:self.lab];
       
        
    }
    return self;
}

- (void)setName:(NSString *)name{
    _name = name;
    self.lab.text = _name;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.selected)
    {
        self.selectedBackgroundView.backgroundColor = [UIColor grayColor];
        
    }
    
    [_lab makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.contentView);
    }];

}
@end
