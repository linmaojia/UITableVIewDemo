//
//  SVHTTPClient+SameProducts.h
//  ETao
//
//  Created by LXY on 16/5/17.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "SVHTTPClient.h"
#import "YZGBrowsingHistoryModel.h"

typedef void (^HistoryListsCallback)(YZGBrowsingHistoryModel *dic);


@interface SVHTTPClient (HistoryLists)


+ (void)getHistoryListsWithPageNum:(NSInteger)PageNum  Target:(id)target CallBack:(HistoryListsCallback)historyListsCallback;

@end
