

#import <Foundation/Foundation.h>


@class YZGProductArr;
@interface YZGBrowsingHistoryModel : NSObject


@property (nonatomic, strong) NSString *brandName;     /**< 品牌名称 */
@property (nonatomic, strong) NSArray<YZGProductArr *> *productArr;

@end


@interface YZGProductArr : NSObject


@property (nonatomic, strong) NSString *path;    /**< 产品图片地址 */


@end
