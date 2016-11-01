//
//  YZGNewProductCollectionViewCell.m
//  yzg
//
//  Created by EDS on 16/6/3.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGNewProductCollectionViewCell.h"
@interface YZGNewProductCollectionViewCell ()
@property (nonatomic, strong) UIImageView *productImageView;
@property (nonatomic, strong) UILabel *priceLable;


@end

@implementation YZGNewProductCollectionViewCell
#pragma mark **************** 懒加载
- (UIImageView *)productImageView
{
    if (_productImageView == nil)
    {
        _productImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg1"]];
        _productImageView.backgroundColor = [UIColor whiteColor];
    }
    return _productImageView;
}
- (UILabel *)priceLable
{
    if (_priceLable == nil)
    {
        _priceLable = [[UILabel alloc] init];
        _priceLable.text = @"零售价：660.00 元";
        _priceLable.font = [UIFont systemFontOfSize:12];
        _priceLable.textColor = RGB(153, 153, 153);
        _priceLable.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLable;
}

#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubviewsForCell];
        [self addConstraintForCell];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark **************** 添加子视图
- (void)addSubviewsForCell
{
    [self.contentView addSubview:self.productImageView];
    [self.contentView addSubview:self.priceLable];

}
- (void)setModel:(TwoSubsetModel *)model{
    _model = model;
    
    NSURL *imageURL = [NSURL URLWithString:[model.picUri stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [_productImageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"bg1"] options:SDWebImageLowPriority | SDWebImageRetryFailed];

    _priceLable.text = model.name;
}


#pragma mark **************** yues
- (void)addConstraintForCell
{
  
    [_priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@15);
    }];
    [_productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.priceLable.top).offset(-3);
        make.left.right.equalTo(self.contentView);
    }];

}

#pragma mark **************** 计算灰线的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
   
}

@end
