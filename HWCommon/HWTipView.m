//
//  HWTipView.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWTipView.h"
#import "HWConstant.h"
UIFont *hwFont;
float hwCornerRadius;
UIColor *hwTextColor;
UIColor *hwBgColor;
@implementation HWTipView
+ (HWTipView *)getInstance {
    static HWTipView *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (id)init {
    self = [super init];
    if (self) {
     
        self.layer.masksToBounds = YES;
        
        self.textAlignment       = NSTextAlignmentCenter;
        self.numberOfLines       = 0;
        self.lineBreakMode       = NSLineBreakByWordWrapping;
        
        
        if(hwBgColor != nil)
        {
            self.backgroundColor = hwBgColor;
        }else
        {
           self.backgroundColor     = UIColorFromRGBA(0, 0, 0, .6);
        }
        if(hwCornerRadius != 0)
        {
            self.layer.cornerRadius = hwCornerRadius;
        }else
        {
            self.layer.cornerRadius  = HWTrasformScale(4.0);
        }
        
        if(hwFont != nil)
        {
            self.font = hwFont;
        }else
        {
          self.font                = [UIFont systemFontOfSize:12];
        }
        if(hwTextColor != nil)
        {
            self.textColor = hwTextColor;
        }else
        {
            self.textColor           = [UIColor whiteColor];
        }
    }
    return self;
}
+ (void)setBgColor:(UIColor *)bgColor
{
    hwBgColor = bgColor;
}
+ (void)setFontSize:(float)fontSize
{
    hwFont = [UIFont systemFontOfSize:fontSize];
}
+ (void)setCornerRadius:(float)cornerRadius
{
    hwCornerRadius = cornerRadius;
}
+ (void)setTextColor:(UIColor *)textColor
{
    hwTextColor = textColor;
}
+ (void)showTip:(NSString *)tip {
    
    HWTipView *tipView = [self getInstance];
    
    CGSize size = [tip boundingRectWithSize:CGSizeMake(HWScreenSize.width / 2.0, HWScreenSize.height / 2.0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: tipView.font} context:nil].size;
    float w = size.width + HWTrasformScale(40);
    float h = size.height + HWTrasformScale(20);
    
    CGRect labelRec =
    CGRectMake((HWScreenSize.width - w) / 2.0, HWScreenSize.height  - HWTrasformScale(158), w, h);
    tipView.frame = labelRec;
    tipView.alpha = 0.5;
    tipView.text  = tip;
    [[UIApplication sharedApplication].keyWindow addSubview:tipView];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         tipView.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [UIView animateWithDuration:0.3
                                                   delay:1.5
                                                 options:0
                                              animations:^{
                                                  tipView.alpha = 0.0;
                                              }
                                              completion:^(BOOL finished) {
                                                  if (finished) {
                                                      [tipView removeFromSuperview];
                                                  }
                                              }];
                         }
                     }];
}

+ (void)hiddenTip {
    [[self getInstance] removeFromSuperview];
}
@end
