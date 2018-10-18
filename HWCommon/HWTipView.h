//
//  HWTipView.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HWTipView : UILabel
#pragma mark - 显示提示框
+ (void)showTip:(NSString*)tip;
#pragma mark - 隐藏提示框
+ (void)hiddenTip;
#pragma mark - 设置提示框字体大小
+ (void)setFontSize:(float)fontSize;
#pragma mark - 设置提示框背景色
+ (void)setBgColor:(UIColor*)bgColor;
#pragma mark - 设置提示框字体颜色
+ (void)setTextColor:(UIColor*)textColor;
#pragma mark - 设置提示框圆角大小
+ (void)setCornerRadius:(float)cornerRadius;
@end
