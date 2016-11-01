//
//  MJCollectImgCell.m
//  Masonry
//
//  Created by LXY on 16/5/30.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJCollectImgCell.h"

@interface MJCollectImgCell ()
@property (nonatomic, strong) UIImageView *productImg;     /**< 品牌图片 */

@end
@implementation MJCollectImgCell

+ (MJCollectImgCell *)hotProductsCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    MJCollectImgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[MJCollectImgCell alloc] init];
    }
    return cell;
    
}

- (UIImageView *)productImg {
    if (!_productImg) {
        _productImg = [[UIImageView alloc] init];
        [_productImg setContentMode:UIViewContentModeScaleAspectFit];
        _productImg.userInteractionEnabled = YES;
     
    }
    return _productImg;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.productImg];
        
    }
    return self;
}



- (void)setModel:(Products *)model{
    _model = model;
    NSURL *imgUrl = [NSURL URLWithString:[model.productPicUri stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [_productImg sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"Default_Image"]];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);

    }];
}
@end
