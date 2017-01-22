//
//  YYRefreshHeader.m
//  Cwg_CALayer
//
//  Created by changwuguo on 2016/12/23.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "YYRefreshHeader.h"

@implementation YYRefreshHeader

+ (instancetype)headerWithRefreshBlock:(void (^)())refreshBlock
{
    YYRefreshHeader *header = [YYRefreshHeader headerWithRefreshingBlock:^{
        !refreshBlock?:refreshBlock();
    }];
    
    // 设置文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    
    // 文字距菊花的距离
    header.labelLeftInset = 20.0f;
    
    // 在导航栏下面自动隐藏
    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间控件
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 字体颜色
    header.stateLabel.textColor = [UIColor grayColor];
    
    // 字体大小
    header.stateLabel.font = [UIFont systemFontOfSize:13.5f];
    
    // 返回下拉刷新控件
    return  header;
}

@end
