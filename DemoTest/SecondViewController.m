//
//  SecondViewController.m
//  Cwg_CALayer
//
//  Created by changwuguo on 2016/12/23.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "SecondViewController.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#import "YYRefreshHeader.h"
#import "YYRefreshFooter.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *imageUrlArr;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"第二个";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testSDWebImageWithProgressView];
}

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
    self.tableView.mj_header = [YYRefreshHeader headerWithRefreshBlock:^{
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
    
    __block UIActivityIndicatorView *activityIndicator;
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrlArr[indexPath.row]] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (!activityIndicator) {
            activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            activityIndicator.color = [UIColor whiteColor];
            [activityIndicator startAnimating];
            [imageView addSubview:activityIndicator];
            [activityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(imageView);
            }];
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
    }];
    
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

- (void)dealloc
{
    NSLog(@"%@ - 销毁", NSStringFromClass([self class]));
}

@end
