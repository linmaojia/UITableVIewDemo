//
//  YZGCategoryTableViewCell.m
//  yzg
//
//  Created by EDS on 16/7/2.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGCategoryTableViewCell.h"
@interface YZGCategoryTableViewCell ()
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *bottomSeparator;
@property (nonatomic, strong) UIImageView *rightSeparator;
@end
@implementation YZGCategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        [self addSuviewsForCell];
        [self addConstraintsForCell];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma mark **************** 重写setter方法
//- (void)setTitleString:(NSString *)titleString
//{
//    _titleString = titleString;
//    self.titleLable.text = titleString;
//}
//- (void)setTitleColor:(UIColor *)titleColor
//{
//    _titleColor = titleColor;
//    self.titleLable.textColor = titleColor;
//}
#pragma mark **************** 添加子控件
- (void)addSuviewsForCell
{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.bottomSeparator];
    [self.contentView addSubview:self.rightSeparator];
}
#pragma mark **************** 添加约束
-(void)addConstraintsForCell
{
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.mas_equalTo(self);
    }];
    [self.bottomSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self);
        make.height.mas_equalTo(1.5);
    }];
    [self.rightSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.mas_equalTo(self);
        make.width.mas_equalTo(2.0);
    }];
}
#pragma mark **************** 懒加载
- (UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:14];
    }
    return _titleLable;
}
- (UIImageView *)bottomSeparator
{
    if (_bottomSeparator == nil)
    {
        _bottomSeparator = [[UIImageView alloc] init];
        _bottomSeparator.backgroundColor = [UIColor colorWithHexColorString:@"e4e4e4"];
    }
    return _bottomSeparator;
}
- (UIImageView *)rightSeparator
{
    if (_rightSeparator == nil)
    {
        _rightSeparator = [[UIImageView alloc] init];
        _bottomSeparator.backgroundColor = [UIColor colorWithHexColorString:@"f9f9f9"];
    }
    return _rightSeparator;
}
@end
