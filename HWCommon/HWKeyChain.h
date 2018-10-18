//
//  HWKeyChain.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWKeyChain : NSObject
#pragma mark - 保存数据到系统keychain
/**
 key 和 value保存到系统keychain
 */
+ (void)save:(NSString *)key data:(id)value;
#pragma mark - 从系统keychain中删除数据
/**
key为数据对应的关键字
 */
+ (void)deleteData:(NSString *)key;
#pragma mark - 从系统keychain中获取数据
/**
从keychain中获取key对应的数据
 */
+ (id)load:(NSString *)key;
@end
