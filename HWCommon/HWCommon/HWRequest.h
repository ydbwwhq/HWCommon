//
//  HWRequest.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWConstant.h"
@interface HWRequest : NSObject
+ (void)sendAsynPostRequest:(NSString*)urlStr paramater:(NSDictionary *)parameter onSuccess:(HWSuccessCallBack)success onFailure:(HWFailureCallBack)failureCallBack;
+(void)sendAsynGetRequest:(NSString*)urlStr paramater:(NSDictionary *)parameter onSuccess:(HWSuccessCallBack)success onFailure:(HWFailureCallBack)failureCallBack;
@end
