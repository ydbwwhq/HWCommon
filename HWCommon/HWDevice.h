//
//  HWDevice.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWDevice : NSObject
#pragma mark - 获取设备唯一ID
+ (NSString*)getDeviceID;
#pragma mark - 获取系统版本号
+ (NSString*)systemVersion;
#pragma mark - 获取手机型号
+ (NSString*)phoneModel;
#pragma mark - 手机分辨率
+ (NSString*)screenResolution;
@end
