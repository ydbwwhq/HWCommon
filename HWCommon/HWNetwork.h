//
//  HWNetwork.h
//  FYSDK
//
//  Created by wanghaoqiang on 2018/10/9.
//  Copyright © 2018年 wanghaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
@interface HWNetwork : NSObject
#pragma mark - 获取网络类型 wifi 无网络 3g 4G 2G
+ (NSString*)networkType;
#pragma mark - 获取网络运营商
+ (NSString*)networkOperator;
#pragma mark - 判断网络是否可用
+ (BOOL)isConnectionAvailable;
#pragma mark - 判断是否连接到wifi
+ (BOOL)isConnectWifi;
#pragma mark - 判断是否连接网络
+ (BOOL)isConnectInternet;
#pragma mark - wifi WLAN 无网络
+ (NetworkStatus)networkStatus;
@end
