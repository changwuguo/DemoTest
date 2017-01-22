//
//  CwgBlockTest.m
//  Cwg_CALayer
//
//  Created by changwuguo on 16/9/26.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "CwgBlockTest.h"

@implementation CwgBlockTest

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)testActionWith:(Bblock)block
{
    _byBlock = block;
    
    NSString *striData = @"BlockTestB say hello to VC";
    block(striData, ^(id testData){
        NSLog(@"BlockTestB get response from VC: %@", testData);
    });
    
}

@end
