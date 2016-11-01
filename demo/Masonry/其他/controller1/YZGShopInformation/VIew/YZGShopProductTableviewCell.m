//
//  YZGShopProductTableviewCell.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopProductTableviewCell.h"

@interface YZGShopProductTableviewCell ()
@property (nonatomic, strong) UIImageView *productImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *roomLable;
@property (nonatomic, strong) UILabel *styleLable;
@property (nonatomic, strong) UILabel *priceLable;
@property (nonatomic, strong) UILabel *wholeSaleLable;
@end
@implementation YZGShopProductTableviewCell
#pragma ******************* init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubViewsForShopCell];
        [self addContraintsForShopCell];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.borderColor = [UIColor colorWithHexColorString:@"e4e4e4"].CGColor;
        self.layer.borderWidth = 1.0;
    }
    return self;

}
#pragma ******************* 添加子控件
- (void)addSubViewsForShopCell
{
    [self.contentView addSubview:self.productImageView];
//    [self.contentView addSubview:self.titleLable];
//    [self.contentView addSubview:self.roomLable];
//    [self.contentView addSubview:self.styleLable];
//    [self.contentView addSubview:self.priceLable];
//    [self.contentView addSubview:self.wholeSaleLable];
//    self.productImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.titleLable.translatesAutoresizingMaskIntoConstraints = NO;
//    self.roomLable.translatesAutoresizingMaskIntoConstraints = NO;
//    self.styleLable.translatesAutoresizingMaskIntoConstraints = NO;
//    self.priceLable.translatesAutoresizingMaskIntoConstraints = NO;
//    self.wholeSaleLable.translatesAutoresizingMaskIntoConstraints = NO;

}
#pragma ******************* 约束
- (void)addContraintsForShopCell
{
    [self.productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.leading.mas_equalTo(self).mas_equalTo(12);
        make.width.height.mas_equalTo(100);
    }];
 

}
#pragma ******************* 重新设置frame
//- (void)setFrame:(CGRect)frame
//{
//    frame.size.height -= 5;
//    [super setFrame:frame];
//}
#pragma mark **************** 重写setter方法
- (void)setProductModel:(YZGProductArr *)productModel
{
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:[productModel.path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"icon"] options:SDWebImageRetryFailed];
}
//- (void)setProductModel:(YZGShopProductsModel *)productModel
//{
//    _productModel = productModel;
//    self.titleLable.text = [NSString stringWithFormat:@"%@ %@",productModel.productType,productModel.productNum];
//    NSString *roomStr = [NSString stringWithFormat:@"试用空间：%@",productModel.applicableRegion];
//    NSMutableAttributedString *roomAtt = [[NSMutableAttributedString alloc] initWithString:roomStr];
//    [roomAtt addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexColorString:@"999999"] range:[roomStr rangeOfString:productModel.applicableRegion]];
//    self.roomLable.attributedText = roomAtt;
//    NSString *styleStr = [NSString stringWithFormat:@"风格：%@",productModel.styleLabel];
//    NSMutableAttributedString *styleAtt = [[NSMutableAttributedString alloc] initWithString:styleStr];
//    [styleAtt addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexColorString:@"999999"] range:[styleStr rangeOfString:productModel.styleLabel]];
//    self.styleLable.attributedText = styleAtt;
//    self.priceLable.text = [NSString stringWithFormat:@"零售价：%@.00 元",productModel.productPrice];
//    self.wholeSaleLable.text = [NSString stringWithFormat:@"批发价：%0.2f元",productModel.dealerPurchasePrice.doubleValue];
//    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:[productModel.path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"logo_del_pro"] options:SDWebImageRetryFailed];
//
//}
#pragma ******************* 懒加载
- (UIImageView *)productImageView
{
    if (_productImageView == nil)
    {
        _productImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"deng"]];
        _productImageView.backgroundColor = [UIColor yellowColor];
    }
    return _productImageView;
}
- (UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"玉艺吊灯YY9146-8";
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textColor = RGB(51, 51, 51);
    }
    return _titleLable;
}
- (UILabel *)roomLable
{
    if (_roomLable == nil)
    {
        _roomLable = [[UILabel alloc] init];
        _roomLable.text = @"客厅/高层/复式/别墅";
        _roomLable.font = [UIFont systemFontOfSize:12];
        _roomLable.textColor = RGB(51, 51, 51);
    }
    return _roomLable;
}
- (UILabel *)styleLable
{
    if (_styleLable == nil)
    {
        _styleLable = [[UILabel alloc] init];
        _styleLable.text = @"美式风格/简约美式";
        _styleLable.font = [UIFont systemFontOfSize:12];
        _styleLable.textColor = RGB(51, 51, 51);
    }
    return _styleLable;
}
- (UILabel *)priceLable
{
    if (_priceLable == nil)
    {
        _priceLable = [[UILabel alloc] init];
        _priceLable.text = @"7771元";
        _priceLable.font = [UIFont systemFontOfSize:12];
        _priceLable.textColor = RGB(153, 153, 153);
    }
    return _priceLable;
}
- (UILabel *)wholeSaleLable
{
    if (_wholeSaleLable == nil)
    {
        _wholeSaleLable = [[UILabel alloc] init];
        _wholeSaleLable.text = @"7771元";
        _wholeSaleLable.font = [UIFont boldSystemFontOfSize:14];
        _wholeSaleLable.textColor = RGB(255, 102, 0);
    }
    return _wholeSaleLable;
}
@end
