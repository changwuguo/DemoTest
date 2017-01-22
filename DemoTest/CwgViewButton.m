//
//  CwgViewButton.m
//  Cwg_CALayer
//
//  Created by changwuguo on 16/9/21.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "CwgViewButton.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface CwgViewButton ()

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, assign) CGSize btnSize;

@end

@implementation CwgViewButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.btnSize = CGSizeMake(50, 50);
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.titleLabel.text = @"点击";
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.btn = btn;
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo(self.btnSize);
        }];
    }
    return self;
}

- (void)didClickBtn:(UIButton *)btn
{
    self.btnSize = CGSizeMake(self.btnSize.width * 1.5, self.btnSize.height * 1.5); // 设置一个属性（btnSize）保存其大小的变化
    
    // 1.告知需要更新约束，但不会立刻开始，系统然后调用updateConstraints
    [self setNeedsUpdateConstraints];
    
    // 2.告知立刻更新约束，系统立即调用updateConstraints
    [self updateConstraintsIfNeeded];
    
    // 3.这里动画当然可以取消，具体看项目的需求
    // 系统block内引用不会导致循环引用，block结束就会释放引用对象
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded]; // 告知页面立刻刷新，系统立即调用updateConstraints
    }];
}

- (void)updateConstraints
{
    // 更新约束
    [self.btn updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.btnSize);
    }];
    
    // according to apple super should be called at end of method
    // 最后必须调用父类的更新约束
    [super updateConstraints];
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES ; //重写这个方法 若视图基于自动布局的
}

@end
