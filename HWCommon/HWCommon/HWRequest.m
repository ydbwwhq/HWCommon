//
//  HWRequest.m
//  HWCommon
//
//  Created by shinezone on 2018/3/13.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWRequest.h"
#import "HWUtility.h"
@implementation HWRequest
+ (void)sendAsynGetRequest:(NSString *)urlStr
                 paramater:(NSDictionary *)parameter
                 onSuccess:(HWSuccessCallBack)success
                 onFailure:(HWFailureCallBack)failureCallBack {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url            = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30];
    NSURLSessionDataTask *dataTask = [session
                                      dataTaskWithURL:url
                                      completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
                                          
                                          if (!error) {
                                              NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                              success(result);
                                          } else {
                                              failureCallBack(error);
                                          }
                                      }];
    [dataTask resume];
}
+ (void)sendAsynPostRequest:(NSString *)urlStr
                  paramater:(NSDictionary *)parameter
                  onSuccess:(HWSuccessCallBack)successCallBack
                  onFailure:(HWFailureCallBack)failureCallBack {
    NSURLSession *session        = [NSURLSession sharedSession];
    NSURL *url                   = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"content-type"];
    [request setTimeoutInterval:30];
  
    NSString *tStr;
    NSData *postData       = [HWUtility dataFromDic:parameter];
    request.HTTPBody = postData;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            failureCallBack(error);
        }else
        {
            successCallBack(data);
        }
    }];
    [dataTask resume];
}
@end
