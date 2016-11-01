//
//  MyShoppingCarCell.m
//  Masonry
//
//  Created by LXY on 16/5/13.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJShoppingCarCell.h"

@interface MJShoppingCarCell ()
{
  
    
}
@end

@implementation MJShoppingCarCell


#pragma mark  - 内部初始化方法
+ (MJShoppingCarCell *)shoppingCarCellWithTableView:(UITableView *)tableView {
    
    MJShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[MJShoppingCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
}

#pragma mark  - 懒加载控件


- (UIImageView *)productImg {
    if (!_productImg) {
        _productImg = [[UIImageView alloc] init];
        [_productImg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(proudctImageTap:)]];
        _productImg.userInteractionEnabled = YES;
    }
    return _productImg;
}

- (UILabel *)productNameLab {
    if (!_productNameLab) {
        _productNameLab = [[UILabel alloc] init];
        _productNameLab.font = systemFont(14);
    }
    return _productNameLab;
}

- (UILabel *)sizeLab {
    if (!_sizeLab) {
        _sizeLab = [[UILabel alloc] init];
        _sizeLab.font = systemFont(10);
        _sizeLab.textColor = hexColor(949494);
        _sizeLab.numberOfLines = 0;
    }
    return _sizeLab;
}

- (UILabel *)costPriceLab {
    if (!_costPriceLab) {
        _costPriceLab = [[UILabel alloc] init];
        _costPriceLab.font = systemFont(10);
        _costPriceLab.textColor = hexColor(949494);
        _costPriceLab.textAlignment = NSTextAlignmentLeft;
    }
    return _costPriceLab;
}


- (UILabel *)currentPriceLab {
    if (!_currentPriceLab) {
        _currentPriceLab = [[UILabel alloc] init];
        _currentPriceLab.font = systemFont(10);
        _currentPriceLab.textColor = hexColor(FF6600);
        _currentPriceLab.textAlignment = NSTextAlignmentLeft;
    }
    return _currentPriceLab;
}

//商品图片被点击
- (void)proudctImageTap:(UITapGestureRecognizer *)tap {
    self.cellImgClick(self.indexPath);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = hexColor(FAFAFA);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.productImg];
        [self.contentView addSubview:self.productNameLab];
        [self.contentView addSubview:self.sizeLab];
        [self.contentView addSubview:self.costPriceLab];
        [self.contentView addSubview:self.currentPriceLab];
       
  
    }
    return self;
}



- (void)setModel:(Products *)model {
    
    _model = model;
    NSString *productPicUri = [model.productPicUri stringByAppendingString:@"@!product-list"];
    
    productPicUri = [productPicUri stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//转码
    
    [_productImg sd_setImageWithURL:[NSURL URLWithString:productPicUri] placeholderImage:[UIImage imageNamed:@"Default_Image"]];
    _productNameLab.text = [NSString stringWithFormat:@"%@%@",model.brandName,model.productNum];

    model.specWidth = model.specWidth ? model.specWidth : @"0";
    model.specHeight = model.specHeight ? model.specHeight : @"0";
    model.specLength = model.specLength ? model.specLength : @"0";
    
    _sizeLab.text = [NSString stringWithFormat:@"规格: W:%@ H:%@ D:%@",model.specWidth,model.specHeight,model.specLength];
    _costPriceLab.text = [NSString stringWithFormat:@"零售价: %.2f元",model.originPrice];
    
    if (model.authentic == 2) {
        _currentPriceLab.hidden = NO;
        _currentPriceLab.text = [NSString stringWithFormat:@"批发价: %.2f元",model.productPrice];
    } else {
        _currentPriceLab.hidden = YES;
    }
    
    
}


- (void)layoutSubviews {
    [super layoutSubviews];

    
    [_productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.height.width.equalTo(@(AUTO_MATE_HEIGHT(75)));
    }];
    [_productNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(AUTO_MATE_HEIGHT(8));
        make.height.equalTo(@(AUTO_MATE_HEIGHT(15)));
        make.right.equalTo(self.contentView).offset(-5);
        make.left.equalTo(_productImg.mas_right).offset(AUTO_MATE_WIDTH(10));
    }];
    [_sizeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productNameLab.mas_bottom).offset(AUTO_MATE_HEIGHT(4));
        make.left.equalTo(_productImg.mas_right).offset(AUTO_MATE_WIDTH(10));
        make.height.equalTo(@(AUTO_MATE_HEIGHT(15)));
    }];
    [_costPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sizeLab.bottom).offset(AUTO_MATE_HEIGHT(4));
        make.left.equalTo(_productImg.mas_right).offset(AUTO_MATE_WIDTH(10));
        make.height.equalTo(@(AUTO_MATE_WIDTH(15)));
    }];
    [_currentPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_costPriceLab.bottom).offset(AUTO_MATE_HEIGHT(4));
        make.left.equalTo(_productImg.mas_right).offset(AUTO_MATE_WIDTH(10));
        make.height.equalTo(@(AUTO_MATE_WIDTH(15)));
    }];
    
 
 
}



@end
