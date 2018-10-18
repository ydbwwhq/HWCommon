//
//  SzWaitV.h
//  SzSDK
//
//  Created by shinezone on 16/8/17.
//  Copyright © 2016年 shinezone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWWaitV : UIView
+ (void)show;
+ (void)showInCenter:(CGPoint)point;
+ (HWWaitV*)getInstance;
+ (void)hidden;
@property (weak,nonatomic) UIActivityIndicatorView *indicatorV;
@end
