//
//  ThirdViewController.h
//  DemoTest
//
//  Created by changwuguo on 2017/1/10.
//  Copyright © 2017年 changwuguo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ThirdVCBlock)(id vc);

@interface ThirdViewController : UIViewController

- (instancetype)initWithBlock:(ThirdVCBlock)thirdVCBlock;

@end
