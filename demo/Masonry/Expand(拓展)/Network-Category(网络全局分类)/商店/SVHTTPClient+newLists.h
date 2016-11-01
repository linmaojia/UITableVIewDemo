//
//  SVHTTPClient+SameProducts.h
//  ETao
//
//  Created by LXY on 16/5/17.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "SVHTTPClient.h"


typedef void (^newsListsCallback)(NSDictionary *dic);


@interface SVHTTPClient (newLists)


+ (void)getNewListsWithTarget:(id)target CallBack:(newsListsCallback)historyListsCallback;

@end
