//
//  DEMO1_VC.m
//  Masonry
//
//  Created by LXY on 16/5/11.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO4_VC.h"
#import "HRTabView.h"
#import "DEMO2_VC.h"
@interface DEMO4_VC ()<UIScrollViewDelegate>
{
    NSMutableArray *buttonArray;    /**< 按钮数组 */
}
@property (nonatomic, strong) UIView *bottomView;    /**< 底部视图 */
@property (nonatomic, strong) UIScrollView *scroll;    /**< Scrollow视图 */
@property (nonatomic, strong) HRTabView *tableView;    /**< tableView视图 */
@property (nonatomic, strong) HRTabView *tableView1;
@property (nonatomic, strong) UIView *centerView;    /**< 顶部中间视图 */
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *tempBtn;
@end

@implementation DEMO4_VC


#pragma mark 懒加载控件
- (UIView *)centerView{
    
    if(!_centerView){
        _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
        NSArray *array = [NSArray arrayWithObjects:@"推荐",@"关注" ,nil];
        for(int i = 0;i<2;i++){
            UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(i*100, 0, 100, 40);
            button.tag = 100+i;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
             [button setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
            button.backgroundColor = [UIColor whiteColor];
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            if(i == 0 ){
                button.selected = YES;
                self.tempBtn = button;
            }
            [_centerView addSubview:button];
            
            //
          
        }
        
        self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 38, 100, 2)];
        self.lineView.backgroundColor = [UIColor greenColor];
         [_centerView addSubview:self.lineView];
     
    }
   return _centerView;
}
- (HRTabView *)tableView{
    
    if(!_tableView){
       NSArray * _nameArray = @[@"Table-分区-左滑",@"Table-个人设置-Grouped",@"清除缓存SDWebImage",@"Scrollow-Table-没完",@"Table-下拉背景拉长",@"Table-下拉背景变大",@"Table-下拉背景，头像变大"];
        
        _tableView= [[HRTabView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-64) Target:self];
        _tableView.nameArray = _nameArray;
        _tableView.backgroundColor = [UIColor whiteColor];
        
        //cell 点击回调
        ESWeakSelf;
        _tableView.cellClickAction = ^(NSInteger indexPath){
            DEMO2_VC *demo2 = [[DEMO2_VC alloc]init];
            [__weakSelf.navigationController pushViewController:demo2 animated:YES];
        };
    }
    return _tableView;
}
- (HRTabView *)tableView1{
    
    if(!_tableView1){
          NSArray * _nameArray = @[@"Table-分区-左滑",@"Table-个人设置-Grouped",@"清除缓存SDWebImage",@"Scrollow-Table-没完",@"Table-下拉背景拉长",@"Table-下拉背景变大",@"Table-下拉背景，头像变大",@"Table-下拉背景，头像变大",@"Table-下拉背景，头像变大",@"Table-下拉背景，头像变大",@"Table-下拉背景，头像变大",@"Table-下拉背景，头像变大"];
        _tableView1=[[HRTabView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT-64) Target:self];
        _tableView1.nameArray = _nameArray;
        _tableView1.backgroundColor = [UIColor whiteColor];
    }
    return _tableView1;
}

- (UIScrollView *)scroll{
    
    if(!_scroll){
        
        _scroll=[[UIScrollView alloc] init];
        //_scroll.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);//内边距
        _scroll.contentSize=CGSizeMake(2 * SCREEN_WIDTH, SCREEN_HEIGHT-64);
        _scroll.scrollEnabled=YES;
        _scroll.delegate=self;
        _scroll.bounces=NO;
        _scroll.pagingEnabled=YES;
        _scroll.showsHorizontalScrollIndicator=YES;
        _scroll.directionalLockEnabled=YES;//指定控件只能在一个方向滚动
        _scroll.backgroundColor = [UIColor grayColor];
        
        [_scroll addSubview:self.tableView];
        [_scroll addSubview:self.tableView1];
    }
    return _scroll;
}



#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self layoutSubviews];//控件布局
}

- (void)setNav{
    UIButton *returnbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnbutton.frame=CGRectMake(0, 0, 40, 40);
    [returnbutton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:0];
    [returnbutton addTarget:self action:@selector(leftBarButtonItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [returnbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc]initWithCustomView:returnbutton];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    
    self.navigationItem.titleView =self.centerView;
}
//view正在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat index = scrollView.contentOffset.x/ scrollView.frame.size.width;
    NSLog(@"----%f----s%f",index,scrollView.contentOffset.x); //偏移量
    /*
     偏移到一半就切换
     */
    if(index > 0.5 && index <0.6){
        [self changeBtn:1];//切换按钮
  
    }else if(index < 0.5 && index >0.4){
        
        [self changeBtn:0];
    }

}

- (void)changeBtn:(NSInteger)index{
    
    self.tempBtn.selected = !self.tempBtn.selected;
    UIButton *preBtn = (UIButton *)[self.centerView viewWithTag:100+index];
    preBtn.selected = YES;
    self.tempBtn = preBtn;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation((preBtn.tag-100)*100, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            
        }
    }];

}

//view已经停止滚动
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if ([scrollView isKindOfClass:[UITableView class]]) {
//        return;
//    }
//    
//    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
//    NSLog(@"----%d----s%f",index,scrollView.contentOffset.x); //偏移量
//    /*
//     偏移到一半就切换
//     */
//    if(index == 1 || index == 0 ){
//     
//        self.tempBtn.selected = !self.tempBtn.selected;
//        UIButton *preBtn = (UIButton *)[self.centerView viewWithTag:100+index];
//        preBtn.selected = YES;
//        self.tempBtn = preBtn;
//        
//        [UIView animateWithDuration:0.2 animations:^{
//            self.lineView.transform = CGAffineTransformMakeTranslation((preBtn.tag-100)*100, 0);
//        } completion:^(BOOL finished) {
//            if (finished) {
//               
//            }
//        }];
//    }
//
//   
//    
//}
//按钮切换
-(void)buttonAction:(UIButton *)sender{
    self.tempBtn.selected = !self.tempBtn.selected;
    sender.selected = YES;
    self.tempBtn = sender;
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation((sender.tag-100)*100, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self.scroll.contentOffset = CGPointMake((sender.tag-100)*SCREEN_WIDTH, 0);
        }
    }];
    
    
}
- (void)leftBarButtonItemClicked:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 控件布局
- (void)layoutSubviews {
   
    NSLog(@"---%f",self.view.jk_height);
    
    [self.view addSubview:self.scroll];
    [_scroll makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
      }];

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
