//
//  DEMO1_VC.m
//  Masonry
//
//  Created by LXY on 16/5/11.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO6_VC.h"
#define  personBgImgHeight AUTO_MATE_HEIGHT(240)
#define  icon_w 80

@interface DEMO6_VC ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _scale;
}

@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) UIImageView *personBgImg;    /**< 个人背景图 */
@property (nonatomic, strong) UIImageView *personIconImg;    /**< 个人头像 */
@property (nonatomic, strong) UIView *topView;    /**< 导航栏topView */
@property (nonatomic, strong) UILabel *personNameLab;    /**< 用户名称 */
@end

@implementation DEMO6_VC


#pragma mark 懒加载控件

- (UILabel *)personNameLab {
    
    if (!_personNameLab) {
        _personNameLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, SCREEN_WIDTH-80, 40)];
        _personNameLab.text=@"月前龙马";
        _personNameLab.textColor=[UIColor whiteColor];
        _personNameLab.textAlignment=NSTextAlignmentCenter;
        
    }
    return _personNameLab;
}
- (UIView *)topView {
    
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor=[UIColor clearColor];
        
    }
    return _topView;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线为none
        _tableView.backgroundColor = [UIColor clearColor];//背景要透明，不然个人背景看不到
        
        //table 的表头
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, personBgImgHeight)];
        UITapGestureRecognizer *tapp=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBgAction:)];
        [_tableView.tableHeaderView addGestureRecognizer:tapp];
    }
    return _tableView;
}
- (UIImageView *)personBgImg {
    
    if (!_personBgImg) {
        _personBgImg = [[UIImageView alloc] init];
        _personBgImg.image = [UIImage imageNamed:@"bg.jpg"];
        // 填充整个ImageView的，可能只有部分图片显示出来(中间部分)
        _personBgImg.contentMode = UIViewContentModeScaleAspectFill;
        _personBgImg.clipsToBounds=YES;
        _personBgImg.userInteractionEnabled = YES;
      
        _scale =  SCREEN_WIDTH / personBgImgHeight;//图片宽高比例
        
    }
    return _personBgImg;
}
- (UIImageView *)personIconImg {
    //头像
    if (!_personIconImg) {
        
        _personIconImg = [[UIImageView alloc] init];
        _personIconImg.backgroundColor = [UIColor yellowColor];
        _personIconImg.image = [UIImage imageNamed:@"icon.jpg"];
        _personIconImg.layer.borderWidth=1.5;
        _personIconImg.layer.borderColor=[UIColor whiteColor].CGColor;
        _personIconImg.layer.cornerRadius = icon_w * 0.5;
        _personIconImg.clipsToBounds = YES;
        _personIconImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeIconAction:)];
        [_personIconImg addGestureRecognizer:tap];
        
        
    }
    return _personIconImg;
}


#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];//控件布局
}

//切换背景
-(void)changeBgAction:(UITapGestureRecognizer *)sender{
    NSLog(@"更换背景");
}
//切换头像
-(void)changeIconAction:(UITapGestureRecognizer *)sender{
    NSLog(@"更换头像");
}


#pragma mark - CollectionView 代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
    
}

//Cell显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIden];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; //选中cell时无色
    cell.textLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithRed:0.540  green:0.564  blue:0.589 alpha:1];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"---%ld",indexPath.row);
}

#pragma mark - scrollView  代理方法

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);//偏移量
    
   
    
        //上滑偏移量增加
        if (scrollView.contentOffset.y >= 0) {
    
            //背景图偏移
            self.personBgImg.frame = CGRectMake(0, 0,SCREEN_WIDTH, personBgImgHeight - scrollView.contentOffset.y);
            
            
            //top 的透明度
            CGFloat alpho = scrollView.contentOffset.y;
            self.topView.backgroundColor = RGBA(56, 131, 211, alpho/100);
    
        }
        //下滑偏移量减小
        if (scrollView.contentOffset.y < 0) {
            // 高度宽度同时拉伸 从中心放大 图片,,,,乘与2 从中间放大 ,,乘与1.2 从右边放大 横坐标能x=0,从左边开始放大
            CGFloat imgH = personBgImgHeight - scrollView.contentOffset.y * 2;
            CGFloat imgW = imgH * _scale;//等比例
            //从中间放大，横坐标能x=0,从左边开始放大
            self.personBgImg.frame = CGRectMake(scrollView.contentOffset.y * _scale,0, imgW,imgH);
    
    
        }
    
     //头像偏移
    self.personIconImg.frame=CGRectMake((SCREEN_WIDTH - icon_w) / 2, (personBgImgHeight - icon_w) / 2-scrollView.contentOffset.y, icon_w, icon_w);


    
}


#pragma mark - 控件布局
- (void)layoutSubviews {
    /*
     背景放在tableView 的前面
     */
    
    [self.view addSubview:self.personBgImg];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.personIconImg];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.personNameLab];

    
    [_personBgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self.view);
        make.height.equalTo(@(personBgImgHeight));
    }];
    
    [_personIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_personBgImg);
        make.width.height.equalTo(@(icon_w));
    }];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self.view);
        make.height.equalTo(@(64));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
