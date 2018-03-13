//
//  HWFile.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWFile.h"

@implementation HWFile
+ (BOOL)fileExistsAtPath:(NSString *)filePath {
    NSFileManager* fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}
+ (BOOL)writeFile:(NSString *)content filePath:(NSString *)filePath append:(BOOL)isAppend {
    BOOL success = false;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath]) {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        if(isAppend) {
            [fileHandle seekToEndOfFile];
        }
        [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
        success = true;
    }
    else {
        NSString *folderPath =[filePath stringByDeletingLastPathComponent];
        if (![fileManager fileExistsAtPath:folderPath]) {
            NSError *error;
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
            if(error) {
                success = false;
            }
            else {
                success=[fileManager createFileAtPath:filePath contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
            }
        }
        else {
            success=[fileManager createFileAtPath:filePath contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
        }
    }
    return success;
}
+ (NSData*)readFile:(NSString *)filePath {
    NSData *data;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath])
    {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        data = [fileHandle readDataToEndOfFile];
    }
    return data;
}
+ (float) fileSizeAtPath:(NSString*) filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize]/(1024*1024.0);
    }
    return 0;
}
+ (float )folderSizeAtPath:(NSString*) folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];//从前向后枚举器／／／／//
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
@end
