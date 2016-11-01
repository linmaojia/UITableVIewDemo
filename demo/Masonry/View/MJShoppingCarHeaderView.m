

#import "MJShoppingCarHeaderView.h"


@interface MJShoppingCarHeaderView ()



@end

@implementation MJShoppingCarHeaderView

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = hexColor(FAFAFA);
        _lineView.layer.borderColor = hexColor(EAEAEA).CGColor;
        _lineView.layer.borderWidth = 0.5f;
    }
    return _lineView;
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectBtn setImage:[UIImage imageNamed:@"Unselected"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(headerViewSelectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _selectBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
    }
    return _selectBtn;
}

- (UIImageView *)titleImg {
    if (!_titleImg) {
        _titleImg = [[UIImageView alloc] init];
        _titleImg.image = [UIImage imageNamed:@"iconfont-SHOP-60x60"];
    }
    return _titleImg;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = systemFont(16);
    }
    return _titleLab;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = hexColor(FFFFFF);
        [self addSubview:self.lineView];
        [self addSubview:self.selectBtn];
        [self addSubview:self.titleImg];
        [self addSubview:self.titleLab];
       
        //判断分区头按钮是否选中通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CheckSectionBtn:) name:@"CheckSectionBtn" object:nil];
        
    }
    return self;
}
//分区头是否选中
-(void)CheckSectionBtn:(NSNotification *)sender{
    
    NSInteger isSelect=[sender.userInfo[@"isSelect"] integerValue];
    NSInteger sectionIndex=[sender.userInfo[@"section"] integerValue];
    
    if(_section == sectionIndex){
        self.selectBtn.selected = isSelect;
    }

    
}
//移除通知的接受者
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CheckSectionBtn" object:nil];
    
}

- (void)setSection:(NSInteger)section{
    _section = section;
}

- (void)headerViewSelectButtonClicked:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(shoppingCarHeaderViewSelectButtonClicked:section:)]) {
        [self.delegate shoppingCarHeaderViewSelectButtonClicked:sender.selected section:_section];
    }
}

- (void)setShopModel:(MJShoppingCarModel *)shopModel {
    _titleLab.text = shopModel.brandName;
    _selectBtn.selected = shopModel.select;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int offsetX = (AUTO_MATE_HEIGHT(50) - AUTO_MATE_HEIGHT(40)) * 0.5;
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(AUTO_MATE_HEIGHT(10)));
    }];
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(AUTO_MATE_HEIGHT(35)));
        make.left.equalTo(self).offset(AUTO_MATE_WIDTH(10));
        make.centerY.equalTo(self).offset(offsetX);
    }];
    [_titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(AUTO_MATE_HEIGHT(20)));
        make.left.equalTo(_selectBtn.mas_right).offset(AUTO_MATE_WIDTH(10));
        make.centerY.equalTo(self).offset(offsetX);
    }];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleImg.mas_right).offset(AUTO_MATE_WIDTH(5));
        make.height.equalTo(@(AUTO_MATE_HEIGHT(20)));
        make.centerY.equalTo(self).offset(offsetX);
    }];
}


@end
