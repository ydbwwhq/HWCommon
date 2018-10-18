//
//  HWRequest.h
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWConstant.h"
@interface HWRequest : NSMutableURLRequest
@property(strong,nonatomic) NSURLSessionDataTask *dataTask;
- (instancetype)initWithURLStr:(NSString*)urlStr;
- (void)asynPostRequest:(NSDictionary *)parameter onSuccess:(HWSuccessCallBack)success onFailure:(HWFailureCallBack)failureCallBack;
- (void)asynGetRequest:(NSDictionary *)parameter onSuccess:(HWSuccessCallBack)success onFailure:(HWFailureCallBack)failureCallBack;
- (void)startRequest;
@end
