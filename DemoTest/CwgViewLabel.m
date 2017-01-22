//
//  CwgViewLabel.m
//  Cwg_CALayer
//
//  Created by changwuguo on 16/9/21.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "CwgViewLabel.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface CwgViewLabel ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CwgViewLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 创建label
        self.label = [UILabel new];
        self.label.mas_key = @"cwgLabel";
        self.label.numberOfLines = 0;
        self.label.backgroundColor = [UIColor yellowColor];
        self.label.lineBreakMode = NSLineBreakByTruncatingTail;
        self.label.textColor = [UIColor redColor];
        self.label.text = @"有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。翩翩君子，温润如玉，真正有存在感的人，反而不会刻意去强调他的存在感。他的出现，永远都恰到好处。我所欣赏的存在感，不是长袖善舞巧言令色，而是对他人的真心关照；不是锋芒毕露计较胜负，而是让人相处得舒服；不是时时刻刻聒噪不休，而是关键时刻能挺身而出。别总急着出风头，希望你能有恰到好处的存在感。有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。翩翩君子，温润如玉，真正有存在感的人，反而不会刻意去强调他的存在感。他的出现，永远都恰到好处。我所欣赏的存在感，不是长袖善舞巧言令色，而是对他人的真心关照；不是锋芒毕露计较胜负，而是让人相处得舒服；不是时时刻刻聒噪不休，而是关键时刻能挺身而出。别总急着出风头，希望你能有恰到好处的存在感。";
        [self addSubview: self.label];
        
        [self.label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(25);
            make.left.equalTo(10);
            make.right.equalTo(-10);
        }];

    }
    return self;
}

// 添加约束
- (void)layoutSubviews {
    //1. 执行 [super layoutSubviews];
    [super layoutSubviews];
    
    //2. 设置preferredMaxLayoutWidth: 多行label约束的完美解决
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    //3. 设置preferredLayoutWidth后，需要再次执行 [super layoutSubviews];
    //其实在实际中这步不写，也不会出错，官方解释是说设置preferredLayoutWidth后需要重新计算并布局界面，所以这步最好执行
    [super layoutSubviews];
}

@end
