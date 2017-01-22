//
//  YYRefreshFooter.h
//  Cwg_CALayer
//
//  Created by changwuguo on 2016/12/23.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "MJRefreshAutoNormalFooter.h"

@interface YYRefreshFooter : MJRefreshAutoNormalFooter

+ (instancetype)footerWithRefreshBlock:(void (^)())loadMoreBlock;

@end
