//
//  YZGShopConnectionHeaderView.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopConnectionHeaderView.h"
#import "Masonry.h"
@interface YZGShopConnectionHeaderView ()
@property (nonatomic, strong) UIImageView *leftRedView;
@property (nonatomic, strong) UILabel *setionLable;
@end
@implementation YZGShopConnectionHeaderView
#pragma ******************* init
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        [self addSubViewsForHeaderView];
        [self addConstraintsForHeaderView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma ******************* 添加自控件
- (void)addSubViewsForHeaderView
{
    [self.contentView addSubview:self.leftRedView];
    [self.contentView addSubview:self.setionLable];
    self.leftRedView.translatesAutoresizingMaskIntoConstraints = NO;
    self.setionLable.translatesAutoresizingMaskIntoConstraints = NO;
}
#pragma ******************* 添加自控件
- (void)addConstraintsForHeaderView
{
    [self.leftRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(2);
    }];
    [self.setionLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.leading.mas_equalTo(self.leftRedView.mas_trailing).mas_offset(4);
    }];
}
#pragma mark **************** 设置样式
- (void)setFrame:(CGRect)frame
{
    if (self.section == 0)
    {
        frame.origin.y += 8;
        frame.size.height -= 16;
    }else
    {
        frame.origin.y -= 12;
        frame.size.height += 4;
    }
    [super setFrame:frame];
}
#pragma ******************* 重写setter方法
- (void)setSectionTitle:(NSString *)sectionTitle
{
    _sectionTitle = sectionTitle;
    self.setionLable.text = sectionTitle;
}
#pragma ******************* 懒加载
- (UIImageView *)leftRedView
{
    if (_leftRedView == nil)
    {
        _leftRedView = [[UIImageView alloc] init];
        _leftRedView.backgroundColor = RGB(58, 88, 153);
    }
    return _leftRedView;
}
- (UILabel *)setionLable
{
    if (_setionLable == nil)
    {
        _setionLable = [[UILabel alloc] init];
        _setionLable.text = @"  联系客服";
        _setionLable.font = [UIFont boldSystemFontOfSize:16];
        _setionLable.textAlignment = NSTextAlignmentLeft;
        _setionLable.backgroundColor = [UIColor whiteColor];
    }
    return _setionLable;
}
@end
