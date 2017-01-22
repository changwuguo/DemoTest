//
//  MJCigHeader.m
//  Pcms
//
//  Created by wei on 2016/10/19.
//  Copyright © 2016年 cig. All rights reserved.
//

#import "MJCigHeader.h"

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MJCigHeader()

@property (strong, nonatomic) UIView      *bgView;
@property (strong, nonatomic) UILabel     *label;
@property (strong, nonatomic) UIImageView *logoActivity;

@end

@implementation MJCigHeader

#pragma mark - 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    CGFloat headerHeight = 60;
    
    // 背景
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -SCREEN_HEIGHT + headerHeight, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    
    // 控件高度
    self.mj_h = headerHeight;
    
    // 添加label
    self.label = [[UILabel alloc] init];
    self.label.textColor = [UIColor lightGrayColor];
    self.label.font = [UIFont boldSystemFontOfSize:12.0f];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    // Logo
    NSArray *loadingImgs = @[[UIImage imageNamed:@"pull_to_refresh_loading_0"],
                             [UIImage imageNamed:@"pull_to_refresh_loading_1"],
                             [UIImage imageNamed:@"pull_to_refresh_loading_2"],
                             [UIImage imageNamed:@"pull_to_refresh_loading_3"]
                             ];
    self.logoActivity = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.logoActivity.animationImages = loadingImgs;
    self.logoActivity.image = [UIImage imageNamed:@"pull_to_refresh_loading_0"];
    [self addSubview:self.logoActivity];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logoActivity.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.4);
    self.label.frame = CGRectMake(0, self.logoActivity.mj_y + self.logoActivity.mj_h, self.bounds.size.width, 20);
}

#pragma mark - 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark - 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark - 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self.logoActivity stopAnimating];
            self.label.text = @"下拉刷新";
            break;
        case MJRefreshStatePulling:
            [self.logoActivity stopAnimating];
            self.label.text = @"释放更新";
            break;
        case MJRefreshStateRefreshing:
            [self.logoActivity startAnimating];
            self.label.text = @"加载中...";
            break;
        default:
            break;
    }
}

#pragma mark - 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    if (pullingPercent > 1.0 || pullingPercent < 0.01) {
        self.logoActivity.transform = CGAffineTransformIdentity;
    }
    else {
        self.logoActivity.transform = CGAffineTransformMakeScale(pullingPercent, pullingPercent);
    }
}

@end
