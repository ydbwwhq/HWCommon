//
//  HWNetwork.m
//  FYSDK
//
//  Created by wanghaoqiang on 2018/10/9.
//  Copyright © 2018年 wanghaoqiang. All rights reserved.
//

#import "HWNetwork.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
@implementation HWNetwork


+ (NSString *)getWALANType
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSString *currentStatus = info.currentRadioAccessTechnology;
    NSString *netconnType = @"other";
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"] || [currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"] || [currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]||[currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
        netconnType = @"2G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
        netconnType = @"4G";
    }
    return netconnType;
}
+ (NSString*)networkType
{
    NetworkStatus status = [HWNetwork networkStatus];
    NSString *state = @"other";
    switch (status) {
        case NotReachable:
            state = @"";
            break;
        case ReachableViaWiFi:
            state = @"wifi";
            break;
        case ReachableViaWWAN:
            state = [HWNetwork getWALANType];
            break;
        default:
        {
            state = @"other";
        }
            break;
    }
    return state;
}
+ (NSString*)networkOperator
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    //当前手机所属运营商名称
    NSString *mobileCarrier;
    //先判断有没有SIM卡，如果没有则不获取本机运营商
    if (!carrier.isoCountryCode) {
        mobileCarrier = @"";
    }else{
        mobileCarrier = [carrier carrierName];
    }
    return mobileCarrier;
}
//判断网络状态 wifi 无网络 3g
+ (NetworkStatus)networkStatus {
    
    Reachability *reach= [Reachability reachabilityWithHostName:@"www.apple.com"];
    return [reach currentReachabilityStatus];
}

//判断网络是否可用
+ (BOOL)isConnectionAvailable {
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}
//判断是否连接网络
+ (BOOL)isConnectInternet {
    BOOL isExistenceNetwork = NO;
    Reachability *reach=[Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}
//判断是否连接到wifi
+ (BOOL)isConnectWifi {
    BOOL isExistenceNetwork = NO;
    Reachability *reach=[Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = NO;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}

@end
