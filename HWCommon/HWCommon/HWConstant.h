//
//  HWConstant.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWUtility.h"
#define SzScreenSize              [UIApplication sharedApplication].keyWindow.rootViewController.view.bounds.size
#define SzScreenScale              [UIScreen mainScreen].scale
#define SzTrasformScale(a)         (a * [HWUtility getScreenPer])

// 16进制颜色值直接转化为color
#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
// RGBA
#define UIColorFromRGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// RGB
#define UIColorFromRGB(R, G, B)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
// RGB same value
#define UIColorFromRGBSameValue(v)   UIColorFromRGB(v, v, v)

typedef void (^HWSuccessCallBack)(NSString *returnValue);
typedef void (^HWFailureCallBack)(NSError *error);
