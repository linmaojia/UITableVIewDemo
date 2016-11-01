//
//  YZGShopBrandAdressCell.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopBrandAdressCell.h"
#import "YZGShopAdressModel.h"
@interface YZGShopBrandAdressCell ()
@property (nonatomic, strong) UIView *titleBackgroudView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *phoneLable;
@property (nonatomic, strong) UILabel *addressLable;
@property (nonatomic, strong) UILabel *detailLable;
@end
@implementation YZGShopBrandAdressCell
#pragma ******************* init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubViewsForBrandCell];
        [self addConstraintsForBrandCell];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma mark **************** 重写setter方法
- (void)setAdressModel:(YZGShopAdressModel *)adressModel
{
    _adressModel = adressModel;
    self.titleLable.text = [NSString stringWithFormat:@"   %@",adressModel.merCompany];
    self.phoneLable.text = [NSString stringWithFormat:@"电话：%@",adressModel.merMobile1];
    NSString *address = [adressModel.merAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.detailLable.text = address;
}
#pragma ******************* 添加子控件  
- (void)addSubViewsForBrandCell
{
    [self.contentView addSubview:self.titleBackgroudView];
    [self.titleBackgroudView addSubview:self.titleLable];
    [self.contentView addSubview:self.phoneLable];
    [self.contentView addSubview:self.addressLable];
    [self.contentView addSubview:self.detailLable];
    self.titleBackgroudView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.addressLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailLable.translatesAutoresizingMaskIntoConstraints = NO;
}
#pragma ******************* 约束
- (void)addConstraintsForBrandCell
{
    [self.titleBackgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self);
        make.height.mas_equalTo(AUTO_MATE_HEIGHT(30));
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.mas_equalTo(self.titleBackgroudView).mas_offset(1.5);
        make.bottom.trailing.mas_equalTo(self.titleBackgroudView).mas_offset(-1.5);
    }];
    [self.phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).mas_offset(20);
        make.top.mas_equalTo(self.titleBackgroudView.mas_bottom).mas_offset(20);
    }];
    [self.addressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.phoneLable);
        make.top.mas_equalTo(self.phoneLable.mas_bottom).mas_offset(10);
    }];
    [self.detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addressLable);
        make.leading.mas_equalTo(self.addressLable.mas_trailing);
        make.trailing.mas_equalTo(self).mas_offset(-20);
    }];
}
#pragma mark **************** 设置样式
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 5;
    frame.size.width -= 15;
    [super setFrame:frame];
}
#pragma ******************* 懒加载
- (UIView *)titleBackgroudView
{
    if (_titleBackgroudView == nil)
    {
        _titleBackgroudView = [[UIView alloc] init];
        _titleBackgroudView.backgroundColor = RGB(197, 217, 217);
    }
    return _titleBackgroudView;
}
- (UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"  中山市古镇哈佛斯顿灯饰门市部";
        _titleLable.font = [UIFont systemFontOfSize:15];
        _titleLable.backgroundColor = [UIColor colorWithRed:232/255.0 green:247/255.0 blue:252/255.0 alpha:1.0];
        _titleLable.textColor = RGB(51, 51, 51);
    }
    return _titleLable;
}
- (UILabel *)phoneLable
{
    if (_phoneLable == nil)
    {
        _phoneLable = [[UILabel alloc] init];
        _phoneLable.text = @"电话：18022028610";
        _phoneLable.font = [UIFont systemFontOfSize:12];
        _phoneLable.backgroundColor = [UIColor whiteColor];
        _phoneLable.textColor = RGB(102, 102, 102);
    }
    return _phoneLable;
}
- (UILabel *)addressLable
{
    if (_addressLable == nil)
    {
        _addressLable = [[UILabel alloc] init];
        _addressLable.text = @"地址：";
        _addressLable.font = [UIFont systemFontOfSize:12];
        _addressLable.backgroundColor = [UIColor whiteColor];
        _addressLable.textColor = RGB(102, 102, 102);
    }
    return _addressLable;
}
- (UILabel *)detailLable
{
    if (_detailLable == nil)
    {
        _detailLable = [[UILabel alloc] init];
        _detailLable.text = @" 中山市古镇东兴中路12号灯都时代广场2楼11号";
        _detailLable.font = [UIFont systemFontOfSize:12];
        _detailLable.backgroundColor = [UIColor whiteColor];
        _detailLable.numberOfLines = 2;
        _detailLable.textColor = RGB(102, 102, 102);
        _detailLable.textAlignment = NSTextAlignmentLeft;
    }
    return _detailLable;
}
@end
