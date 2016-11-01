//
//  MJScrollerCell.m
//  Masonry
//
//  Created by LXY on 16/5/27.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJScrollerCell.h"
#define Scrollow_H AUTO_MATE_WIDTH(150)
@interface MJScrollerCell()
@property (nonatomic, strong) UIScrollView *scroll;    /**< Scrollow视图 */

@end
@implementation MJScrollerCell

- (UIScrollView *)scroll{
    
    if(!_scroll){
        
        _scroll=[[UIScrollView alloc] init];
        _scroll.contentSize=CGSizeMake(SCREEN_WIDTH, Scrollow_H);
        _scroll.scrollEnabled=YES;
        _scroll.showsHorizontalScrollIndicator=YES;
        _scroll.directionalLockEnabled=YES;//指定控件只能在一个方向滚动
        _scroll.backgroundColor = [UIColor whiteColor];
   
    }
    return _scroll;
}
- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
}
+ (CGFloat)getScrollowHeight{
    return Scrollow_H;
}
#pragma mark  - 内部初始化方法
+ (MJScrollerCell *)shoppingCarCellWithTableView:(UITableView *)tableView {
    
    MJScrollerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[MJScrollerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = hexColor(FAFAFA);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.scroll];
       
        
    }
    return self;
}

- (void)setModel:(MJShoppingCarModel *)model {
    _model = model;
    
    NSArray *imgarray =  _model.products;
    _scroll.contentSize=CGSizeMake(imgarray.count * (Scrollow_H+2) , Scrollow_H);
    
    for(int i = 0; i< imgarray.count; i++){
        Products *product = imgarray[i];
        NSURL *imgUrl = [NSURL URLWithString:[product.productPicUri stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *(Scrollow_H+2), 0, Scrollow_H, Scrollow_H)];
        imageView.backgroundColor = [UIColor grayColor];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 100+i;
        [imageView sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"Default_Image"]];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer
                                              alloc]initWithTarget:self action:@selector(showImgAction:)];
        [imageView addGestureRecognizer:singleTap];
        [self.scroll addSubview:imageView];
    }
  
}
- (void)showImgAction:(UITapGestureRecognizer *)sender{
    Products * product = _model.products[sender.view.tag-100];
    self.ScrollowImgClick(product.productId);
}
- (void)layoutSubviews {
    [super layoutSubviews];

    [_scroll makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.contentView);
    }];

}
@end
