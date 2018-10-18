//
//  HWFile.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWFile : NSObject
#pragma mark - 创建文件
+ (Boolean)createFile:(NSString*)filePath;
#pragma mark - 删除文件
+ (Boolean)deleteFile:(NSString*)filePath;
#pragma mark - 判断文件是否存在
+ (BOOL)fileExistsAtPath:(NSString *)filePath;
#pragma mark - 写文件

+ (BOOL)writeFile:(NSString *)content filePath:(NSString*)filePath append:(BOOL)isAppend;
#pragma mark - 读文件
+ (NSData*)readFile:(NSString*)filePath;
#pragma mark - 获取Document路径
+ (NSString*)getDocumentPath;
#pragma mark - 从文件中读取对象
+ (NSObject *)readObjFromFile:(NSString *)filePath;
#pragma mark - 把对象写入文件
+ (Boolean)writeObjTofile:(NSObject *)obj filePath:(NSString *)filePath;
@end
