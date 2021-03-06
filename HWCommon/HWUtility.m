//
//  HWUtility.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWUtility.h"
#import "HWConstant.h"

#import <CommonCrypto/CommonDigest.h>
#define iOSVersionEqualTo(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define iOSVersionGreaterThan(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define iOSVersionGreaterThanOrEqualTo(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define iOSVersionLessThan(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define iOSVersionLessThanOrEqualTo(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
@implementation HWUtility

+ (NSInteger)getStrByteLength:(NSString *)str
{
    NSInteger length = 0;
    if(str)
    {
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSData *da = [str dataUsingEncoding:enc];
        length = [da length];
    }
    return length;
}

+(BOOL)isIncludeSpace:(NSString *) str {
    NSRange range = [str rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES; //yes代表包含空格
    }else {
        return NO; //反之
    }
}

+ (NSInteger)getTimestamp {
    NSTimeInterval date = [[NSDate date] timeIntervalSince1970];
    NSInteger timestamp = (NSInteger)date;
    return timestamp;
}

+ (float)getScreenPer {
    float per = 1.0;
    if (iOSVersionGreaterThan(@"8")) {
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
            per = HWScreenSize.height / 667.0;
            
        } else if ((orientation == UIInterfaceOrientationLandscapeLeft) ||
                   (orientation == UIInterfaceOrientationLandscapeRight)) {
            per = HWScreenSize.width / 667.0;
        }
        if (HWScreenSize.height == 812.0 || HWScreenSize.width == 812) {
            per = 1.0;
        }
    }
    return per;
}
+ (float)getNavigationH {
    
    float navH = 0.0;
    UINavigationController *nav =
    [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    navH = nav.navigationBar.frame.size.height;
    
    if (![UIApplication sharedApplication].statusBarHidden) {
        navH += 20;
    }
    return navH;
}
+ (NSString *)getDateTime:(NSString *)format Date:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    return [self getDateFormatTime:dateFormatter Date:date];
}

+ (NSString *)getDateFormatTime:(NSDateFormatter *)format Date:(NSDate *)date {
    
    return [format stringFromDate:date];
}
+ (BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}
+ (BOOL)isLegalMoblieNum:(NSString *)phoneNum {
    
    NSString *MOBILE             = @"^1[345678][0-9]{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNum];
}
+ (BOOL)isLegalEmail:(NSString *)emailNum {
    
    NSString *emailRegex   = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailNum];
}
+ (NSString *)base64EncodingWithDic:(NSDictionary *)dic {
    NSData *sourceData = [self dataFromDic:dic];
    return [self base64EncodingWithData:sourceData];
}
+ (NSString *)base64EncodingWithStr:(NSString *)sourceStr
{
    NSData *data = [sourceStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    return baseString;
}
+ (NSString *)base64EncodingWithData:(NSData *)sourceData {
    if (!sourceData) {
        //如果sourceData则返回nil，不进行加密。
        return nil;
    }
    NSString *resultString = [sourceData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return resultString;
}

+ (NSString *)getMD5String:(NSString *)str {
    
    const char *value = [str UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    size_t len = strlen(value);
    CC_MD5(value, (CC_LONG)len, outputBuffer);
    NSMutableString *outputString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++)
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    return outputString;
}
#pragma mark - DICD DATA ARRAY JSONSTR互转
+ (NSDictionary *)dicFromData:(NSData *)data {
    
    NSError *err      = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    if (err) {
        NSLog(@"格式错误");
    }
    return dic;
}
+ (NSData *)dataFromDic:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *result      = nil;
    if (dic != nil) {
        result = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
        if (parseError) {
            NSLog(@"格式错误");
        }
    } else {
        NSLog(@"格式错误");
    }
    return result;
}
+ (NSDictionary *)dicFromJsonStr:(NSString *)str {
    
    NSData *jsonData  = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = nil;
    if (jsonData) {
        dic = [self dicFromData:jsonData];
    } else {
        NSLog(@"格式错误");
    }
    return dic;
}

+ (NSString *)jsonStrFromDic:(NSDictionary *)dic {
    
    NSData *jsonData = [self dataFromDic:dic];
    NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return result;
}

+ (NSString *)jsonStrFromObj:(id)json {
    NSError *parseError = nil;
    NSString *result    = nil;
    if (json != nil) {
        NSData *jsonData =
        [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&parseError];
        result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (parseError) {
            NSLog(@"json字符串不合法");
        }
    } else {
        NSLog(@"json字符串不合法");
    }
    return result;
}

+ (id)ObjFromJsonStr:(NSString *)str {
    id object           = nil;
    NSError *parseError = nil;
    if (str.length > 0) {
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        object =
        [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&parseError];
        if (parseError) {
            NSLog(@"json字符串不合法");
        }
    } else {
        NSLog(@"json字符串不合法");
    }
    return object;
}

+ (BOOL)isJailbroken {
    
    BOOL jailbroken     = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath   = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    return jailbroken;
}
+ (UIViewController *)currentViewController {
    // Find best view controller
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findBestViewController:viewController];
}
+ (UIViewController *)findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [self findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}
+ (BOOL)isSameDay:(long)iTime1 Time2:(long)iTime2
{
    //传入时间毫秒数
    NSDate *pDate1 = [NSDate dateWithTimeIntervalSince1970:iTime1/1000];
    NSDate *pDate2 = [NSDate dateWithTimeIntervalSince1970:iTime2/1000];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:pDate1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:pDate2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}
+ (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
+ (float) randomBetween:(float)smallerNumber And:(float)largerNumber
{
    //设置精确的位数
    int precision = 100;
    //先取得他们之间的差值
    float subtraction = largerNumber - smallerNumber;
    //取绝对值
    subtraction = ABS(subtraction);
    //乘以精度的位数
    subtraction *= precision;
    //在差值间随机
    float randomNumber = arc4random() % ((int)subtraction+1);
    //随机的结果除以精度的位数
    randomNumber /= precision;
    //将随机的值加到较小的值上
    float result = MIN(smallerNumber, largerNumber) + randomNumber;
    //返回结果
    return result;
}
#pragma mark - 加载图片、资源
+ (NSString *)getResourcePath:(NSString *)subPath bundle:(NSString *)bundle {
    
    NSString *fullPath;
    NSString *path = [[NSBundle mainBundle] pathForResource:bundle ofType:@"bundle"];
    if (path) {
        fullPath = [NSString stringWithFormat:@"%@/%@", path, subPath];
    }
    
    return fullPath;
}
#pragma mark - 获取图片
+ (UIImage *)getImageFromPath:(NSString *)subPath bundle:(NSString*)bundle {
    
    UIImage *image = nil;
    NSString *path = [self getResourcePath:subPath bundle:bundle];
    image          = [UIImage imageWithContentsOfFile:path];
    return image;
}
@end
