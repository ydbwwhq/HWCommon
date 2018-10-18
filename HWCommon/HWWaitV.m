//
//  SzWaitV.m
//  SzSDK
//
//  Created by shinezone on 16/8/17.
//  Copyright © 2016年 shinezone. All rights reserved.
//

#import "HWWaitV.h"
#import "HWConstant.h"
@implementation HWWaitV
+ (HWWaitV *)getInstance
{
    static HWWaitV* instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[HWWaitV alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return instance;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        UIActivityIndicatorView *indicatiorV = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
        indicatiorV.color = [UIColor grayColor];
        indicatiorV.center = CGPointMake(HWScreenSize.width/2.0, HWScreenSize.height/2.0);
        _indicatorV = indicatiorV;
        [self addSubview:indicatiorV];
    }
    return self;
}
+ (void)show
{
    CGPoint point = CGPointMake(HWScreenSize.width/2.0, HWScreenSize.height/2.0);
    [HWWaitV showInCenter:point];
}
+ (void)showInCenter:(CGPoint)point
{
    [self getInstance].indicatorV.center = point;
    [[UIApplication sharedApplication].keyWindow addSubview:[self getInstance]];
    [[self getInstance].indicatorV startAnimating];
}
+ (void)hidden
{
    [[self getInstance] removeFromSuperview];
    [[self getInstance].indicatorV stopAnimating];
}
@end
