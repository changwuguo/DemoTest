//
//  YYRefreshFooter.m
//  Cwg_CALayer
//
//  Created by changwuguo on 2016/12/23.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "YYRefreshFooter.h"

@implementation YYRefreshFooter

+ (instancetype)footerWithRefreshBlock:(void (^)())loadMoreBlock
{
    YYRefreshFooter *footer = [YYRefreshFooter footerWithRefreshingBlock:^{
        !loadMoreBlock?:loadMoreBlock();
    }];
    
    // 设置文字
    [footer setTitle:@"点击或上拉加载" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"数据已加载完" forState:MJRefreshStateNoMoreData];
    
    // 文字距菊花的距离
    footer.labelLeftInset = 20.0f;
    
    // 字体颜色
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    
    // 字体大小
    footer.stateLabel.font = [UIFont systemFontOfSize:14.0f];
    
    
    // 设置footer
    return footer;
}

@end
