//
//  HWFile.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWFile : NSObject
#pragma mark - 判断文件是否存在
/**
参数为文件绝对路径
 */
+ (BOOL)fileExistsAtPath:(NSString *)filePath;
#pragma mark - 写文件
/**
 @brief 写文件操作
 @param content  写入内容
 @param filePath 文件决定路径
 @param isAppend 是否以追加方式写入内容
 @return 是否写入成功
 */
+ (BOOL)writeFile:(NSString *)content filePath:(NSString*)filePath append:(BOOL)isAppend;
#pragma mark - 读文件
/**
 *  读出整个文件的内容
 *  @param filePath 文件完整路径
 *  @return 返回文件内容
 */
+ (NSData*)readFile:(NSString*)filePath;
#pragma mark - 获取文件大小
/**
 *  获取文件大小
 *  @param filePath 文件完整路径
 *  @return 获取文件大小单位M
 */
+ (float)fileSizeAtPath:(NSString*) filePath;
#pragma mark - 获取文件夹大小
/**
 *  获取文件夹大小
 *  @param folderPath 文件完整路径
 *  @return 获取文件大小单位M
 */
+ (float )folderSizeAtPath:(NSString*) folderPath;
@end
