//
//  HWRequest.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWRequest.h"
#import "HWUtility.h"
#import "FYUtility.h"
@implementation HWRequest
- (instancetype)initWithURLStr:(NSString *)urlStr
{
    self = [super initWithURL:[NSURL URLWithString:urlStr]];
    if(self)
    {
        
    }
    return self;
}
- (void)asynGetRequest:(NSDictionary *)parameter onSuccess:(HWSuccessCallBack)successCallBack onFailure:(HWFailureCallBack)failureCallBack {
    
    NSMutableString *serverURL = [NSMutableString stringWithString:self.URL.absoluteString];
    if(parameter != nil && [parameter.allKeys count] > 0)
    {
        [serverURL appendString:@"?"];
        for(int i = 0 ;i < [parameter.allKeys count]; i ++)
        {
            NSString *key = parameter.allKeys[i];
            id value = parameter[key];
            [serverURL appendFormat:@"%@=%@",key,[FYUtility URLEncoding:value]];
            if(i != parameter.allKeys.count -1)
            {
                [serverURL appendString:@"&"];
            }
        }
    }
    NSURLSession *session        = [NSURLSession sharedSession];
    [self setHTTPMethod:@"GET"];
    [self setTimeoutInterval:30];
    [self setURL:[NSURL URLWithString:serverURL]];
    
    _dataTask = [session dataTaskWithRequest:self completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            failureCallBack(error);
        }else
        {
            successCallBack(data);
        }
    }];
}
- (void)asynPostRequest:(NSDictionary *)parameter
                  onSuccess:(HWSuccessCallBack)successCallBack
                  onFailure:(HWFailureCallBack)failureCallBack {
    NSURLSession *session        = [NSURLSession sharedSession];
    [self setHTTPMethod:@"POST"];
    [self setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"content-type"];
    [self setTimeoutInterval:30];
    NSData *postData       = [HWUtility dataFromDic:parameter];
    [self setHTTPBody:postData];
    
    _dataTask = [session dataTaskWithRequest:self completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            failureCallBack(error);
        }else
        {
            successCallBack(data);
        }
    }];
}
- (void)startRequest
{
    [_dataTask resume];
}
@end
