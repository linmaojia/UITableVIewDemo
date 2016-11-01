//
//  YZGProductHeaderView.m
//  yzg
//
//  Created by EDS on 16/6/1.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "YZGProductHeaderView.h"

@interface YZGProductHeaderView ()
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIButton *popularListButton;
@property (nonatomic, strong) UIImageView *latestProductButton;
@property (nonatomic, strong) UIView *grayView;
@end

@implementation YZGProductHeaderView
- (UILabel *)titleLable
{
    if (_titleLable == nil)
    {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:12];
        _titleLable.numberOfLines = 1;
        _titleLable.textColor = RGB(51, 51, 51);
        _titleLable.text = @"常用分类";
        [_titleLable sizeToFit];
    }
    return _titleLable;
}
- (UIButton *)popularListButton
{
    if (_popularListButton == nil)
    {
        _popularListButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_popularListButton setImage:[UIImage imageNamed:@"rankList"] forState:UIControlStateNormal];
        [_popularListButton sizeToFit];
        [_popularListButton addTarget:self action:@selector(popularButListButtonDidAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popularListButton;
}
#pragma mark **************** init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubviewAndConstraints];
        self.backgroundColor = [UIColor colorWithHexColorString:@"f9f9f9"];
    
    }
    return self;
}
- (void)setSectionTitle:(NSString *)sectionTitle
{
    _titleLable.text = sectionTitle;
  
}
- (void)setOneTitle:(NSString *)oneTitle{
    _oneTitle = oneTitle;
    //判断是否显示排行榜
    if([oneTitle isEqualToString:@"推荐分类"] || [oneTitle isEqualToString:@"品牌"] || [oneTitle isEqualToString:@"价格"])
    {
        _popularListButton.hidden = YES;
    }
    else
    {
        _popularListButton.hidden = NO;
    }
}
#pragma mark **************** 添加子控件和约束
- (void)addSubviewAndConstraints
{
    [self addSubview:self.titleLable];
    [self addSubview:self.popularListButton];
 
}
- (void)popularButListButtonDidAction
{
    if (self.popularListButtonDidClick)
    {
        self.popularListButtonDidClick(self.section);
    }
}
#pragma mark **************** 布局
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.mas_equalTo(self).mas_offset(5);
        make.bottom.mas_equalTo(self);
    }];
    [self.popularListButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).mas_offset(-5);
        make.centerY.mas_equalTo(self.titleLable);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(60);
    }];

}

@end
