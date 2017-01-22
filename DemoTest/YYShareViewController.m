//
//  YYShareViewController.m
//  DemoTest
//
//  Created by changwuguo on 2017/1/11.
//  Copyright © 2017年 changwuguo. All rights reserved.
//

#import "YYShareViewController.h"

@interface YYShareViewController ()

@end

@implementation YYShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addItemWithTitle:@"微信好友" image:UIImageMake(@"icon_moreOperation_shareFriend") type:QMUIMoreOperationItemTypeImportant tag:0];
    
    [self addItemWithTitle:@"朋友圈" image:UIImageMake(@"icon_moreOperation_shareMoment") type:QMUIMoreOperationItemTypeImportant tag:1];
    
    [self addItemWithTitle:@"新浪微博" image:UIImageMake(@"icon_moreOperation_shareWeibo") type:QMUIMoreOperationItemTypeImportant tag:2];
    
    [self addItemWithTitle:@"QQ空间" image:UIImageMake(@"icon_moreOperation_shareQzone") type:QMUIMoreOperationItemTypeImportant tag:3];
    
    [self addItemWithTitle:@"浏览器打开" image:UIImageMake(@"icon_moreOperation_openInSafari") type:QMUIMoreOperationItemTypeNormal tag:4];
    
    [self addItemWithTitle:@"举报" image:UIImageMake(@"icon_moreOperation_report") type:QMUIMoreOperationItemTypeNormal tag:5];
}

@end
