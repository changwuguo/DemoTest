//
//  ThirdViewController.m
//  DemoTest
//
//  Created by changwuguo on 2017/1/10.
//  Copyright © 2017年 changwuguo. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (instancetype)initWithBlock:(ThirdVCBlock)thirdVCBlock
{
    if (self = [super init]) {
        !thirdVCBlock?:thirdVCBlock(self);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)dealloc
{
    NSLog(@"%@ -- dealloc", NSStringFromClass([ThirdViewController class]));
}

@end
