//
//  MJSetCell.m
//  Masonry
//
//  Created by LXY on 16/5/20.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "MJSetCell.h"

@implementation MJSetCell

+ (MJSetCell *)setCellWithTableView:(UITableView *)tableView{
    MJSetCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[MJSetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;

}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = systemFont(16);
        _titleLab.backgroundColor = [UIColor whiteColor];
    }
    return _titleLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.lineView];
       
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-1);
        make.left.equalTo(@(10));
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLab.bottom);
        make.left.equalTo(@(10));
        make.right.equalTo(self.contentView);
        make.height.equalTo(@(1));
    }];
}

@end
