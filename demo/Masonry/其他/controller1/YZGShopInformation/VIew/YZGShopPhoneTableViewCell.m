//
//  YZGShopPhoneTableViewCell.m
//  YZGShopInformation
//
//  Created by 李超 on 16/6/9.
//  Copyright © 2016年 lichao. All rights reserved.
//

#import "YZGShopPhoneTableViewCell.h"
#import "YZGShopServersModel.h"
@interface YZGShopPhoneTableViewCell ()
/*图片*/
@property (nonatomic, strong) UIImageView *iconImageView;
/*客服名*/
@property (nonatomic, strong) UILabel *titleLable;
/*联系电话View*/
@property (nonatomic, strong) UIView *contactPhoneView;
/*销售电话View*/
@property (nonatomic, strong) UIView *salePhoneView;
/*售后QQView*/
@property (nonatomic, strong) UIView *afterSaleQQView;
/*联系电话标签*/
@property (nonatomic, strong) UILabel *contactLable;
/*联系电话号码*/
@property (nonatomic, strong) UIButton *contactPhoneButton;
/*销售电话标签*/
@property (nonatomic, strong) UILabel *saleLable;
/*销售电话号码*/
@property (nonatomic, strong) UIButton *salePhoneButton;
/*售后QQ标签*/
@property (nonatomic, strong) UILabel *afterSaleLable;
/*售后QQ号码*/
@property (nonatomic, strong) UIButton *afterSaleQQButton;
/*售后传真标签*/
@property (nonatomic, strong) UILabel *afterTaxLable;
/*售后传真号码*/
@property (nonatomic, strong) UILabel *afterTaxNumberLable;
/*分割线*/
@property (nonatomic, strong) UIImageView *firstGrayLine;
/*分割线*/
@property (nonatomic, strong) UIImageView *secondGrayLine;
/*分割线*/
@property (nonatomic, strong) UIImageView *thirdGrayLine;
/*微信号*/
@property (nonatomic, strong) UILabel *weixinLable;
/*微信二维码*/
@property (nonatomic, strong) UIImageView *weixinQRCode;
/*用于打电话*/
@property (nonatomic, strong) UIWebView *callWebView;
@property (nonatomic, strong) UIImageView *grayBottomView;
@end
@implementation YZGShopPhoneTableViewCell
#pragma ******************* init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubviewsFoePhoneCell];
        [self addConstraintsFoePhoneCell];
        self.backgroundColor = [UIColor colorWithRed:254/255.0 green:254/255.0 blue:251/255.0 alpha:1.0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma ******************* 添加自控件
- (void)addSubviewsFoePhoneCell
{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.contactPhoneView];
    [self.contactPhoneView addSubview:self.contactLable];
    [self.contactPhoneView addSubview:self.contactPhoneButton];
    [self.contentView addSubview:self.firstGrayLine];
    [self.contentView addSubview:self.salePhoneView];
    [self.salePhoneView addSubview:self.saleLable];
    [self.salePhoneView addSubview:self.salePhoneButton];
    [self.contentView addSubview:self.secondGrayLine];
    [self.contentView addSubview:self.afterSaleQQView];
    [self.afterSaleQQView addSubview:self.afterSaleLable];
    [self.afterSaleQQView addSubview:self.afterSaleQQButton];
    [self.contentView addSubview:self.thirdGrayLine];
    [self.contentView addSubview:self.afterTaxLable];
    [self.contentView addSubview:self.afterTaxNumberLable];
    [self.contentView addSubview:self.grayBottomView];
    [self.contentView addSubview:self.weixinQRCode];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.weixinLable];
    self.titleLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.contactPhoneView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contactLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.contactPhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstGrayLine.translatesAutoresizingMaskIntoConstraints = NO;
    self.salePhoneView.translatesAutoresizingMaskIntoConstraints = NO;
    self.saleLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.salePhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondGrayLine.translatesAutoresizingMaskIntoConstraints = NO;
    self.afterSaleQQView.translatesAutoresizingMaskIntoConstraints = NO;
    self.afterSaleLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdGrayLine.translatesAutoresizingMaskIntoConstraints = NO;
    self.afterTaxLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.afterTaxNumberLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.weixinLable.translatesAutoresizingMaskIntoConstraints = NO;
    self.weixinQRCode.translatesAutoresizingMaskIntoConstraints = NO;
    self.grayBottomView.translatesAutoresizingMaskIntoConstraints = NO;

}
#pragma mark **************** 重写setter方法
- (void)setServersModel:(YZGShopServersModel *)serversModel
{
    _serversModel = serversModel;
    self.titleLable.text = [NSString stringWithFormat:@"  %@",serversModel.cserversName];
    [self.contactPhoneButton setAttributedTitle:[self getAttributeStringFromStr:serversModel.cserversMPhone] forState:UIControlStateNormal];
    [self.salePhoneButton setAttributedTitle:[self getAttributeStringFromStr:serversModel.cserversTel] forState:UIControlStateNormal];
    [self.afterSaleQQButton setAttributedTitle:[self getAttributeStringFromStr:serversModel.cserversICQ] forState:UIControlStateNormal];
    self.afterTaxNumberLable.text = serversModel.brandFaxForSales == nil?@"暂无":serversModel.brandFaxForSales;
    self.weixinLable.text = serversModel.cserversWeiXin == nil?@"微信号：":[NSString stringWithFormat:@"微信号：%@",serversModel.cserversWeiXin];
    [self.weixinQRCode sd_setImageWithURL:[NSURL URLWithString:[serversModel.cserversWeiXinQRCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"logo_del_pro"] options:SDWebImageRetryFailed];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[serversModel.cserversHeadPic stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"logo_del_pro"] options:SDWebImageRetryFailed];
}
#pragma mark **************** 获取属性文本
- (NSMutableAttributedString *)getAttributeStringFromStr:(NSString *)str
{
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:str];
    [att addAttribute:NSUnderlineStyleAttributeName value:@(1) range:[str rangeOfString:str]];
    [att addAttribute:NSUnderlineColorAttributeName value:[UIColor colorWithRed:60/255.0 green:139/255.0 blue:207/255.0 alpha:1.0] range:[str rangeOfString:str]];
    [_contactPhoneButton setAttributedTitle:att forState:UIControlStateNormal];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:60/255.0 green:139/255.0 blue:207/255.0 alpha:1.0] range:[str rangeOfString:str]];
    return att;
}
#pragma mark **************** 设置间距和样式
- (void)setFrame:(CGRect)frame
{

    frame.origin.x += 5;
    frame.size.width -= 15;
    frame.size.height -= 8;
    [super setFrame:frame];
}
#pragma ******************* 布局
- (void)addConstraintsFoePhoneCell
{
    [self.weixinQRCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).mas_offset(-30);
        make.centerY.mas_equalTo(self).mas_offset(5);
        make.width.height.mas_equalTo(AUTO_MATE_WIDTH(60));
    }];
    [self.grayBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.weixinQRCode);
        make.width.height.mas_equalTo(AUTO_MATE_WIDTH(80));
    }];
    [self.weixinLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.weixinQRCode).mas_offset(-8);
        make.top.mas_equalTo(self.grayBottomView.mas_bottom).mas_offset(8);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.weixinQRCode);
        make.width.height.mas_equalTo(20);
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.mas_equalTo(self);
        make.height.mas_equalTo(AUTO_MATE_HEIGHT(30));
    }];
    //联系电话约束
    [self.contactPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).mas_offset(10);
        make.trailing.mas_equalTo(self.weixinQRCode.mas_leading).mas_offset(-30);
        make.height.mas_equalTo(AUTO_MATE_HEIGHT(30));
        make.top.mas_equalTo(self.titleLable.mas_bottom);
    }];
    [self.firstGrayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.contactPhoneView);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.contactPhoneView.mas_bottom);
    }];
    [self.contactLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contactPhoneView);
        make.centerY.mas_equalTo(self.contactPhoneView);
    }];
    [self.contactPhoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contactLable.mas_trailing);
        make.top.bottom.mas_equalTo(self.contactPhoneView);
    }];
    //销售电话
    [self.salePhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.firstGrayLine);
        make.height.mas_equalTo(AUTO_MATE_HEIGHT(30));
        make.top.mas_equalTo(self.firstGrayLine.mas_bottom);
    }];
    [self.secondGrayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.salePhoneView);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.salePhoneView.mas_bottom);
    }];
    [self.saleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.salePhoneView);
        make.centerY.mas_equalTo(self.salePhoneView);
    }];
    [self.salePhoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.saleLable.mas_trailing);
        make.top.bottom.mas_equalTo(self.salePhoneView);
    }];
    //售后QQ
    [self.afterSaleQQView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.secondGrayLine);
        make.height.mas_equalTo(AUTO_MATE_HEIGHT(30));
        make.top.mas_equalTo(self.secondGrayLine.mas_bottom);
    }];
    [self.thirdGrayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.afterSaleQQView);
        make.top.mas_equalTo(self.afterSaleQQView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    [self.afterSaleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.afterSaleQQView);
        make.centerY.mas_equalTo(self.afterSaleQQView);
    }];
    [self.afterSaleQQButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.afterSaleLable.mas_trailing);
        make.top.bottom.mas_equalTo(self.afterSaleQQView);
    }];
    //售后传真
    [self.afterTaxLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.thirdGrayLine);
        make.top.mas_equalTo(self.thirdGrayLine.mas_bottom).mas_offset(12);
    }];
    [self.afterTaxNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.afterTaxLable);
        make.leading.mas_equalTo(self.afterTaxLable.mas_trailing);
    }];

}
#pragma ******************* 懒加载
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil)
    {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
- (UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = @"  客服①";
        _titleLable.backgroundColor = [UIColor colorWithRed:241/255.0 green:248/255.0 blue:252/255.0 alpha:1.0];
        _titleLable.layer.borderWidth = 1.0;
        _titleLable.layer.borderColor = RGB(197, 217, 217).CGColor;
        _titleLable.font = [UIFont boldSystemFontOfSize:15];
        _titleLable.textColor = RGB(51, 51, 51);
    }
    return _titleLable;
}
- (UIView *)contactPhoneView
{
    if (_contactPhoneView == nil)
    {
        _contactPhoneView = [[UIView alloc] init];
    }
    return _contactPhoneView;
}
- (UIView *)salePhoneView
{
    if (_salePhoneView == nil)
    {
        _salePhoneView = [[UIView alloc] init];
    }
    return _salePhoneView;
}
- (UIView *)afterSaleQQView
{
    if (_afterSaleQQView == nil)
    {
        _afterSaleQQView = [[UIView alloc] init];
    }
    return _afterSaleQQView;
}
- (UILabel *)contactLable
{
    if (_contactLable == nil)
    {
        _contactLable = [[UILabel alloc] init];
        _contactLable.text = @"联系电话：";
        _contactLable.textColor = RGB(102, 102, 102);
        _contactLable.font = [UIFont systemFontOfSize:12];
    }
    return _contactLable;
}
- (UIButton *)contactPhoneButton
{
    if (_contactPhoneButton == nil)
    {
        _contactPhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _contactPhoneButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_contactPhoneButton addTarget:self action:@selector(clientWantToCallAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contactPhoneButton;

}
- (UILabel *)saleLable
{
    if (_saleLable == nil)
    {
        _saleLable = [[UILabel alloc] init];
        _saleLable.text = @"销售电话：";
        _saleLable.textColor = RGB(102, 102, 102);
        _saleLable.font = [UIFont systemFontOfSize:12];
    }
    return _saleLable;
}
- (UIButton *)salePhoneButton
{
    if (_salePhoneButton == nil)
    {
        _salePhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _salePhoneButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_salePhoneButton addTarget:self action:@selector(clientWantToCallAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _salePhoneButton;
}
- (UILabel *)afterSaleLable
{
    if (_afterSaleLable == nil)
    {
        _afterSaleLable = [[UILabel alloc] init];
        _afterSaleLable.text = @"售  后QQ：";
        _afterSaleLable.textColor = RGB(102, 102, 102);
        _afterSaleLable.font = [UIFont systemFontOfSize:12];
    }
    return _afterSaleLable;
}
- (UIButton *)afterSaleQQButton
{
    if (_afterSaleQQButton == nil)
    {
        _afterSaleQQButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _afterSaleQQButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _afterSaleQQButton;
}
- (UILabel *)afterTaxLable
{
    if (_afterTaxLable == nil)
    {
        _afterTaxLable = [[UILabel alloc] init];
        _afterTaxLable.text = @"售后传真：";
        _afterTaxLable.textColor = RGB(102, 102, 102);
        _afterTaxLable.font = [UIFont systemFontOfSize:12];
    }
    return _afterTaxLable;
}
- (UILabel *)afterTaxNumberLable
{
    if (_afterTaxNumberLable == nil)
    {
        _afterTaxNumberLable = [[UILabel alloc] init];
        _afterTaxNumberLable.text = @"0760-22344898";
        _afterTaxNumberLable.textColor = RGB(102, 102, 102);
        _afterTaxNumberLable.font = [UIFont systemFontOfSize:12];
    }
    return _afterTaxNumberLable;
}
- (UILabel *)weixinLable
{
    if (_weixinLable == nil)
    {
        _weixinLable = [[UILabel alloc] init];
        _weixinLable.textColor = RGB(102, 102, 102);
        _weixinLable.font = [UIFont systemFontOfSize:11];
    }
    return _weixinLable;
}
- (UIImageView *)weixinQRCode
{
    if (_weixinQRCode == nil)
    {
        _weixinQRCode = [[UIImageView alloc] init];
    }
    return _weixinQRCode;

}
- (UIImageView *)firstGrayLine
{
    if (_firstGrayLine == nil)
    {
        _firstGrayLine = [[UIImageView alloc] init];
        _firstGrayLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _firstGrayLine;
}
- (UIImageView *)secondGrayLine
{
    if (_secondGrayLine == nil)
    {
        _secondGrayLine = [[UIImageView alloc] init];
        _secondGrayLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _secondGrayLine;
}
- (UIImageView *)thirdGrayLine
{
    if (_thirdGrayLine == nil)
    {
        _thirdGrayLine = [[UIImageView alloc] init];
        _thirdGrayLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _thirdGrayLine;
}
- (UIWebView *)callWebView
{
    if (_callWebView == nil)
    {
        _callWebView = [[UIWebView alloc] init];
    }
    return _callWebView;
}
- (UIImageView *)grayBottomView
{
    if (_grayBottomView == nil)
    {
        _grayBottomView = [[UIImageView alloc] init];
        _grayBottomView.backgroundColor = RGB(250, 250, 250);
    }
    return _grayBottomView;
}
#pragma mark **************** 点击电话按钮
- (void)clientWantToCallAction:(UIButton *)button
{
    NSString *phoneNumber = [button currentAttributedTitle].string;
    NSURL *url = [NSURL URLWithString:[@"tel://" stringByAppendingString:phoneNumber]];
    [self.callWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
@end
