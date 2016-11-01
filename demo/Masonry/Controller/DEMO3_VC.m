//
//  DEMO1_VC.m
//  Masonry
//
//  Created by LXY on 16/5/11.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "DEMO3_VC.h"

@interface DEMO3_VC ()
{
    NSMutableArray *buttonArray;    /**< 按钮数组 */
}
@property (nonatomic, strong) UIView *bottomView;    /**< 底部视图 */
@end

@implementation DEMO3_VC


#pragma mark 懒加载控件
- (UIView *)bottomView{
    
    if(!_bottomView){
        
        buttonArray = [NSMutableArray new];//使用数组约束
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *array = [NSArray arrayWithObjects:@"清楚缓存",@"中部" ,nil];
        for(int i=0;i<2;i++){
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
            
            button.backgroundColor = RGB(238, 91, 40);
            [button setTitleColor:[UIColor whiteColor] forState:0];
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font= boldSystemFont(10);
            button.tag=100+i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.bottomView addSubview:button];
            [buttonArray addObject:button];
            
        }
        
        
    }
    return _bottomView;
}

#pragma mark - 系统方法
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];//控件布局
}

#pragma mark - 监听button方法
-(void)buttonAction:(UIButton *)sender{
    switch (sender.tag) {
        case 100:{
       [self alert11];
            
        }
            break;
        case 101:{

           
        }
            break;
            
        default:
            break;
    }
    
    
    
}

//提醒框
-(void)alert11{
     NSInteger size = [[SDImageCache sharedImageCache] getSize];
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"缓存大小:%@",[self fileSizeWithInterge:size]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //点击确定执行的方法
        NSLog(@"傻逼");
        [[SDImageCache sharedImageCache] clearDisk];
    }];
    //添加多个按钮会排成几行
    [alertController addAction:okAction];//确定按钮
    [alertController addAction:cancelAction];//取消按钮
    [self presentViewController:alertController animated:YES completion:nil];
}
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}

#pragma mark - 控件布局
- (void)layoutSubviews {
    [self.view addSubview:self.bottomView];
    
    [_bottomView makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@40);
        make.top.left.right.equalTo(self.view);
    }];
    
    //平均分配 水平
    
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:5 tailSpacing:5];
    [buttonArray makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@40);
        make.bottom.equalTo(self.bottomView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
