//
//  UIImageView+YYImageView.m
//  Cwg_CALayer
//
//  Created by changwuguo on 2016/12/23.
//  Copyright © 2016年 changwuguo. All rights reserved.
//

#import "UIImageView+YYImageView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (YYImageView)

- (void)yy_setImageWithURL:(NSString *)urlStr placeholderImage:(UIImage *)placeholder
{
    __block UIActivityIndicatorView *activityIndicator;
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (!activityIndicator) {
            activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            activityIndicator.color = [UIColor whiteColor];
            [activityIndicator startAnimating];
            [self addSubview:activityIndicator];
            [activityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
            }];
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
    }];
}

@end
