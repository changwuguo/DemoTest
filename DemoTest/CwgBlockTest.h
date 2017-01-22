//
//  CwgBlockTest.h
//  Cwg_CALayer
//
//  Created by changwuguo on 16/9/26.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Ablock)(id testData);
typedef void(^Bblock)(id data, Ablock testBlock);

@interface CwgBlockTest : NSObject

@property (nonatomic, copy) Bblock byBlock;

- (void)testActionWith:(Bblock)block;

@end
