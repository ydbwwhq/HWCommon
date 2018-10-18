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
    NSString *documentPath = [self getDocumentPath];
    filePath = [documentPath stringByAppendingPathComponent:filePath];
    NSFileManager* fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}
+ (BOOL)writeFile:(NSString *)content filePath:(NSString *)filePath append:(BOOL)isAppend {
    BOOL success = false;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *documentPath = [self getDocumentPath];
    filePath = [documentPath stringByAppendingPathComponent:filePath];
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
    NSString *documentPath = [self getDocumentPath];
    filePath = [documentPath stringByAppendingPathComponent:filePath];
    if([fileManager fileExistsAtPath:filePath])
    {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        data = [fileHandle readDataToEndOfFile];
    }
    return data;
}

+ (NSObject *)readObjFromFile:(NSString *)filePath
{
    filePath = [[self getDocumentPath] stringByAppendingPathComponent:filePath];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}
+ (Boolean)writeObjTofile:(NSObject *)obj filePath:(NSString *)filePath
{
    Boolean success = false;
    NSString *documentPath = [self getDocumentPath];
    filePath = [documentPath stringByAppendingPathComponent:filePath];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath])
    {
        success = [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
    }else
    {
        NSString *folderPath =[filePath stringByDeletingLastPathComponent];
        if (![fileManager fileExistsAtPath:folderPath])
        {
            NSError *error;
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
            if(error)
            {
                success = false;
            }else
            {
                success = [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
            }
        }else
        {
            success = [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
        }
    }
    return success;
}
+ (NSString*)getDocumentPath
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)[0];
}
@end
