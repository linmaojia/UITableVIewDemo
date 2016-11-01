//
//  SVHTTPClient+SameProducts.m
//  ETao
//
//  Created by LXY on 16/5/17.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "SVHTTPClient+newLists.h"

@implementation SVHTTPClient (newLists)

+ (void)getNewListsWithTarget:(id)target CallBack:(newsListsCallback)historyListsCallback{
  
     [SVProgressHUD show];
    //配置全局请求头
    [[SVHTTPClient sharedClient] setGlobalHeaderField];
    [[SVHTTPClient sharedClient] setSendParametersAsJSON:YES];
  
    //NSDictionary *params = @{@"rowsPerPage":@"10",@"pageNumber":@(__weakSelf.allProductCurrentPage)};也可以这种
    
    NSString *str = @"20150519160025538AB508D7E-ACB4-44ED-825E-DF4DD6673E18";
    
    NSString *url  = [serviceListPath stringByAppendingString:str];
   
    [[SVHTTPClient sharedClient] GET:url parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {

        [SVProgressHUD dismiss];
       
//        YZGBrowsingHistoryModel *datadic = [YZGBrowsingHistoryModel mj_objectWithKeyValues:(NSDictionary *)response];
        NSLog(@"----%@",response)

            historyListsCallback((NSDictionary *)response);
        
    }];
}

@end
