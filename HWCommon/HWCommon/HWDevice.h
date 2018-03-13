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
@end
