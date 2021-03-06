//
//  DEMO1_VC.m
//  Masonry
//
//  Created by LXY on 16/5/11.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO5_VC.h"
#define  personBgImgHeight AUTO_MATE_HEIGHT(200)
@interface DEMO5_VC ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _scale;
}

@property (nonatomic, strong) UITableView *tableView;    /**< RootTableView */
@property (nonatomic, strong) UIImageView *personBgImg;    /**< 个人背景图 */
@property (nonatomic, strong) UIImageView *personIconImg;    /**< 个人头像 */

@end

@implementation DEMO5_VC


#pragma mark 懒加载控件

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线为none
        _tableView.backgroundColor = [UIColor clearColor];//背景要透明，不然个人背景看不到
        
        //table 的表头
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, personBgImgHeight)];
    }
    return _tableView;
}
- (UIImageView *)personBgImg {
    
    if (!_personBgImg) {
        _personBgImg = [[UIImageView alloc] init];
        _personBgImg.image = [UIImage imageNamed:@"bg1.png"];
        // 填充整个ImageView的，可能只有部分图片显示出来(中间部分)
        _personBgImg.contentMode = UIViewContentModeScaleAspectFill;
        _personBgImg.clipsToBounds=YES;
        
        _scale =  _personBgImg.frame.size.width / _personBgImg.frame.size.height;//图片宽高比例

    }
    return _personBgImg;
}
#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];//控件布局
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
    
    //背景图偏移
    self.personBgImg.frame = CGRectMake(0, 0,SCREEN_WIDTH, personBgImgHeight - scrollView.contentOffset.y);
    
//    //上滑偏移量增加
//    if (scrollView.contentOffset.y >= 0) {
//
//       
//    
//      
//    }
//    //下滑偏移量减小
//    if (scrollView.contentOffset.y < 0) {
//        // 高度宽度同时拉伸 从中心放大 图片
//        CGFloat imgH = personBgImgHeight - scrollView.contentOffset.y * 1.2;
//        CGFloat imgW = imgH * _scale;//等比例
//        //从中间放大，横坐标能x=0,从左边开始放大
//        self.personBgImg.frame = CGRectMake(scrollView.contentOffset.y * _scale,0, imgW,imgH);
//      
//        
//    }
    
    
}


#pragma mark - 控件布局
- (void)layoutSubviews {
    
    [self.view addSubview:self.personBgImg];
     [self.view addSubview:self.tableView];
    
    [_personBgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self.view);
        make.height.equalTo(@(personBgImgHeight));
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
