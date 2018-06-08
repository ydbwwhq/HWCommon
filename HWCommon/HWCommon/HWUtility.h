//
//  HWUtility.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HWUtility : NSObject
#pragma mark - 获取字符串的字节长度
/**
 获取字符串 字节长度 比如 “中”的字节长度为2 “1”的字节长度为1
 */
+ (NSInteger)getStrByteLength:(NSString*)str;
#pragma mark - 检测字符串是否包含空格
/**
 检测字符串是否包含空格
 */
+(BOOL)isIncludeSpace:(NSString *) str;
#pragma mark - 获取时间戳单位s
/**
 获取时间戳单位s
 */
+ (NSInteger)getTimestamp;
#pragma mark - 获取屏屏幕缩放比例
/**
 *  获取屏屏幕缩放比例
 */
+ (float)getScreenPer;
#pragma mark - 获取导航栏高度
/**
 *  获取导航栏高度
 */
+ (float)getNavigationH;
#pragma mark - 根据时间和时间格式 返回时间字符串 针对手机系统的时区
/**
 *  根据时间和时间格式 返回时间字符串 针对手机系统的时区
 *  @param format 时间格式 如（yyyy-mm-dd hh:mm:ss）
 *  @param date   时间
 *  @return 返回时间按照该时间格式对应的字符串
 */
+ (NSString *)getDateTime:(NSString *)format Date:(NSDate *)date;
#pragma mark - 根据时间和时间格式 返回时间字符串 可以自定义时区
/**
 * 根据时间和时间格式 返回时间字符串 可以自定义时区
 *  @param format 时间格式
 *  @param date   时间
 *  @return 返回时间按照该时间格式对应的字符串
 */
+ (NSString *)getDateFormatTime:(NSDateFormatter *)format Date:(NSDate *)date;
#pragma mark - 判断字符串是否为空
/**
 判断字符串是否为空
 @param string 字符串
 @return YES表示空字符串，NO反之
 */
+ (BOOL)isBlankString:(NSString *)string;
#pragma mark - 判断电话号码是否合法
/**
 *  判断电话号码是否合法
 *  @param phoneNum 电话号码
 *  @return  是否合法
 */
+(BOOL)isLegalMoblieNum:(NSString *)phoneNum;
#pragma mark - 判断邮箱是否合法
/**
 *  判断邮箱是否合法
 *  @param emailNum 邮箱号码
 *  @return 是否合法
 */
+ (BOOL)isLegalEmail:(NSString *)emailNum;
#pragma mark - base64加密 入参为字典
/**
 字典转为jsonStr后base64编码
 
 @param dic 转化的字典
 @return json字符串base64后的字符串
 */
+ (NSString *)base64EncodingWithDic:(NSDictionary *)dic;

#pragma mark - base64加密 入参为NSData
/**
 base64编码
 
 @param sourceData 源data
 @return 返回base64字符串
 */
+ (NSString *)base64EncodingWithData:(NSData *)sourceData;
#pragma mark - MD5加密
/**
 *  返回字符串对应的MD5值
 *  @param str 字符串
 *  @return str对应的md5值
 */
+ (NSString *)getMD5String:(NSString *)str;

#pragma mark - NSData直接转化为字典
/**
 data转dic
 @param data 要转的字典
 @return 返回dic
 */
+ (NSDictionary *)dicFromData:(NSData *)data;
#pragma mark - 字符串直接转化为字典
/**
 *  json字符串对应生成字典
 *  @param str 字符串
 *  @return 返回字符串生成的字典
 */
+ (NSDictionary *)dicFromJsonStr:(NSString *)str;
#pragma mark - 字典转化为字符串
/**
 *  字典转化为字符串
 *  @param dic 字典参数
 *  @return 返回转化后的字符串
 */
+ (NSString *)jsonStrFromDic:(NSDictionary *)dic;
#pragma mark - 字典转化为NSData
+ (NSData *)dataFromDic:(NSDictionary *)dic;
#pragma mark - 字典或数组转化为字符串
/**
 *  json转化为字符串
 *  @param json 要转为字符串的json对象
 *  @return jsonString
 */
+ (NSString *)jsonStrFromObj:(id)json;
#pragma mark - 字符串直接转化为字典或者数组
/**
 json字符串转化为array或dictionary
 @param str json字符串
 @return Array 或 Dictionary
 */
+ (id)ObjFromJsonStr:(NSString *)str;
#pragma mark - 判断机器是否越狱
/// 是否越狱
+ (BOOL)isJailbroken;
#pragma mark - 获取当前控制器
/**
 *  获取当前控制器
 *  @return 当前视图控制器
 */
+ (UIViewController *)currentViewController;
#pragma mark - 判断是否为同一天
+ (BOOL)isSameDay:(long)iTime1 Time2:(long)iTime2;
#pragma mark - 产生一个随机数
+ (int)getRandomNumber:(int)from to:(int)to;
#pragma mark - 产生一个随机的浮点数
+ (float) randomBetween:(float)smallerNumber And:(float)largerNumber;
@end
