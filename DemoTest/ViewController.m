//
//  ViewController.m
//  DemoTest
//
//  Created by changwuguo on 2016/12/27.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "ViewController.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "UIImageView+YYImageView.h"

#import "CwgViewLabel.h"
#import "CwgViewButton.h"
#import "CwgBlockTest.h"

#import "YYRefreshHeader.h"
#import "YYRefreshFooter.h"
#import "MJCigHeader.h"

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "PlaceHolderViewController.h"

#import "QMUIMoreOperationController.h"

typedef enum {
    MoreOperationTagShareWechat,
    MoreOperationTagShareMoment,
    MoreOperationTagShareQzone,
    MoreOperationTagShareWeibo,
    MoreOperationTagShareMail,
    MoreOperationTagBookMark,
    MoreOperationTagSafari,
    MoreOperationTagReport
} MoreOperationTag;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, QMUIMoreOperationDelegate>

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *blueView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CwgViewLabel *cwgLabel;
@property (nonatomic, strong) CwgViewButton *cwgBtn;

@property (nonatomic, strong) NSArray *imageUrlArr;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) QMUIMoreOperationController *shareVC;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Demo";
    
    // [self testLayer];
    
    // [self testAnimation];
    
    // [self testMasonry];
    
    // [self testBlock];
    
    // [self testiOS10Version];
    
    [self testSDWebImageWithProgressView];
    
    // [self testSearchBar];
    
    // [self testCycleBlock];
    
    // [self testPlaceHolderView];
    
    // [self testShareVC];
}

#pragma mark
#pragma mark 测试Layer
- (void)testLayer
{
    CALayer *myLayer1 = [CALayer layer];
    myLayer1.backgroundColor = [UIColor purpleColor].CGColor;
    myLayer1.bounds = CGRectMake(0, 0, 200, 200);
    myLayer1.position = CGPointMake(150, 150);
    myLayer1.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:myLayer1];
    
    CALayer *myLayer2 = [CALayer layer];
    myLayer2.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer2.bounds = CGRectMake(0, 0, 100, 100);
    myLayer2.position = CGPointMake(100, 100);
    myLayer2.anchorPoint = CGPointMake(0.5, 0.5);
    [myLayer1 addSublayer:myLayer2];
}

#pragma mark
#pragma mark 测试Animation
- (void)testAnimation
{
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(30, 300, 50, 50)];
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    [self.view addSubview:redView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(90, 300, 50, 50)];
    blackView.backgroundColor = [UIColor blackColor];
    self.blackView = blackView;
    [self.view addSubview:blackView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 300, 50, 50)];
    greenView.backgroundColor = [UIColor greenColor];
    self.greenView = greenView;
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(210, 300, 50, 50)];
    blueView.backgroundColor = [UIColor blueColor];
    self.blueView = blueView;
    [self.view addSubview:blueView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animatedView:self.redView delay:0];
    
    [self animatedView:self.blackView delay:0.1f];
    
    [self animatedView:self.greenView delay:0.2f];
    
    [self animatedView:self.blueView delay:0.3f];
}

// y轴上移动视图上升
- (void)animatedView:(UIView *)view delay:(NSTimeInterval)delay
{
    [UIView animateWithDuration:0.3f delay:delay usingSpringWithDamping:0.5 initialSpringVelocity:50.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint center = view.center;
        center.y -= 100;
        view.center = center;
    } completion:nil];
}

#pragma mark
#pragma mark 测试Masonry
- (void)testMasonry
{
    // [self autoLayoutScrollView];
    
    // [self autoLayoutLabel];
    
    // [self autoLayoutSpacingView];
    
    [self autoLayoutButton];
}

- (void)autoLayoutScrollView
{
    // 创建滚动视图
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self setUpContentView]; // 添加内容视图
}

- (void)setUpContentView {
    // 约束UIScrollView上contentView
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 256.0  green:arc4random() % 255 / 256.0 blue:arc4random() % 255 / 256.0 alpha:1.0];
    [self.scrollView addSubview:contentView];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView); // 此处必填 - 关键点
    }];
    
    // 添加控件到contentView，约束原理与自动布局相同
    UIView *lastView;
    CGFloat height = 30;
    for (int i = 0; i < 15; i ++) {
        UIView *view = UIView.new;
        view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 256.0  green:arc4random() % 255 / 256.0 blue:arc4random() % 255 / 256.0 alpha:1.0];
        [contentView addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.bottom : @0);
            make.left.equalTo(0);
            make.width.equalTo(contentView.width);
            make.height.equalTo(height);
        }];
        
        height += 30;
        lastView = view;
    }
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.bottom);
    }];
}

- (void)autoLayoutLabel
{
    self.cwgLabel = [[CwgViewLabel alloc] initWithFrame:self.view.frame];
    self.cwgLabel.mas_key = @"cwgLabel";
    self.cwgLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.cwgLabel];
}

- (void)autoLayoutSpacingView
{
    // 首先添加5个视图
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 5; i ++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor greenColor];
        [self.view addSubview:view];
        [array addObject:view]; //保存添加的控件
    }
    
    // 水平方向控件间隔固定等间隔
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:10 tailSpacing:10];
    [array makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(50);
        make.height.equalTo(70);
    }];
    
    // 水平方向宽度固定等间隔
    // [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:70 leadSpacing:10 tailSpacing:10];
    //    [array makeConstraints:^(MASConstraintMaker *make) { // 数组额你不必须都是view
    //        make.top.equalTo(50);
    //        make.height.equalTo(70);
    //    }];
    
}

- (void)autoLayoutButton
{
    self.cwgBtn = [[CwgViewButton alloc] initWithFrame:self.view.frame];
    self.cwgBtn.mas_key = @"cwgBtn";
    self.cwgBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.cwgBtn];
}

#pragma mark
#pragma mark 测试Block
- (void)testBlock
{
    CwgBlockTest *blockTest = [CwgBlockTest new];
    
    [blockTest testActionWith:^(id data, Ablock testBlock) {
        NSLog(@"Get message from blockTestB: %@", data);
        if (testBlock) {
            testBlock(@"Response for message from VC");
        }
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // Block的调用
        blockTest.byBlock(@"哈哈哈", ^(id testData){
            NSLog(@"BlockTestB get response from VC: %@", testData);
        });
    });
}

#pragma mark
#pragma mark 测试iOS10Version
- (void)testiOS10Version
{
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSArray *strArr = [systemVersion componentsSeparatedByString:@"."];
    
    NSInteger maxVersion = [[strArr firstObject] integerValue];
    NSLog(@"maxVersion = %ld", maxVersion);
    
    NSInteger midVersion = [strArr[1] integerValue];
    NSLog(@"midVersion = %ld", midVersion);
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
    NSLog(@"11111");
#else //固件低于iOS10
    NSLog(@"22222");
    
#endif
    
}

#pragma mark
#pragma mark 测试SDWebImage带ProgressView
- (void)testSDWebImageWithProgressView
{
    self.imageUrlArr = @[@"http://pic.qiantucdn.com/58pic/19/65/61/56fe53c226753_1024.jpg",
                         @"http://pic.qiantucdn.com/01/41/22/11bOOOPIC8b.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/55/37/5838b0d956044_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/55/37/5838ae6c6287e_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/55/44/5838c6450c398_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/13/80/33/90u58PIC5IE_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/11/71/98/87D58PICGsM.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/54/16/5836dae8140bd_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/53/31/5835672763835_1024.jpg",
                         @"http://pic.qiantucdn.com/58pic/25/53/39/583576130d935_1024.jpg"
                         ];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate   = self;
    tableView.dataSource = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.bounces = YES;
    tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView = tableView;
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJCigHeader headerWithRefreshingBlock:^{
        [weakSelf testRefreshBlock];
    }];
    
    self.tableView.mj_footer = [YYRefreshFooter footerWithRefreshBlock:^{
        [weakSelf testLoadMoreBlock];
    }];
    
    [self.view addSubview:self.tableView];
}

- (void)testRefreshBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"下拉刷新");
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)testLoadMoreBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"上拉加载");
        [self.tableView.mj_footer endRefreshing];
    });
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageUrlArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self createTableCellWithTableView:tableView];
    
    UIImageView *imageView = [cell.contentView.subviews lastObject];
    
    [imageView yy_setImageWithURL:self.imageUrlArr[indexPath.row] placeholderImage:nil];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (UITableViewCell *)createTableCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.backgroundColor = [UIColor blackColor];
        [cell.contentView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView.mas_left).offset(20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(150, 100));
        }];
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)testSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    searchBar.barTintColor = [UIColor clearColor];
    [self.view addSubview:searchBar];
    
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
}

#pragma mark
#pragma mark 测试Block循环引用
- (void)testCycleBlock
{
    ThirdViewController *thirdVC = [[ThirdViewController alloc] initWithBlock:^(ThirdViewController *vc) {
        vc.view.backgroundColor = [UIColor redColor];
    }];
    
    [self.navigationController pushViewController:thirdVC animated:YES];
}

#pragma mark
#pragma mark 测试占位图
- (void)testPlaceHolderView
{
    PlaceHolderViewController *placeHolderVC = [[PlaceHolderViewController alloc] init];
    [self.navigationController pushViewController:placeHolderVC animated:YES];
}

#pragma mark
#pragma mark 测试分享视图
- (void)testShareVC
{
    _shareVC = [[QMUIMoreOperationController alloc] init];
    _shareVC.delegate = self;
    
    [_shareVC addItemWithTitle:@"微信好友" image:[UIImage imageNamed:@"icon_moreOperation_shareFriend"] type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareWechat];
    
    [_shareVC addItemWithTitle:@"朋友圈" image:[UIImage imageNamed:@"icon_moreOperation_shareMoment"] type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareMoment];
    
    [_shareVC addItemWithTitle:@"新浪微博" image:[UIImage imageNamed:@"icon_moreOperation_shareWeibo"] type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareWeibo];
    
    [_shareVC addItemWithTitle:@"QQ空间" image:[UIImage imageNamed:@"icon_moreOperation_shareQzone"] type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareQzone];
    
    [_shareVC addItemWithTitle:@"浏览器打开" image:[UIImage imageNamed:@"icon_moreOperation_openInSafari"] type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagSafari];
    
    [_shareVC addItemWithTitle:@"举报" image:[UIImage imageNamed:@"icon_moreOperation_report"] type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagReport];
    
    [_shareVC showFromBottom];
}

- (void)moreOperationController:(QMUIMoreOperationController *)moreOperationController didSelectItemAtTag:(NSInteger)tag
{
    QMUIMoreOperationItemView *itemView = [moreOperationController itemAtTag:tag];
    NSString *tipString = itemView.titleLabel.text;
    switch (tag) {
        case MoreOperationTagShareWechat:
            break;
        case MoreOperationTagShareMoment:
            break;
        case MoreOperationTagShareWeibo:
            break;
        case MoreOperationTagShareQzone:
            break;
        case MoreOperationTagShareMail:
            break;
        case MoreOperationTagSafari:
            break;
        case MoreOperationTagReport:
            break;
        default:
            break;
    }
    [moreOperationController hideToBottom];
}

@end

