//
//  HWDevice.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWDevice.h"
#import "HWKeyChain.h"
#import <UIKit/UIKit.h>
static NSString *deviceID = @"deviceID";
@implementation HWDevice
+ (NSString*)getDeviceID
{
    NSString *result = @"";
    if([HWKeyChain load:deviceID])
    {
        result = [HWKeyChain load:deviceID];
    }else
    {
        result = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [HWKeyChain save:deviceID data:result];
    }
    return result;
}
@end
