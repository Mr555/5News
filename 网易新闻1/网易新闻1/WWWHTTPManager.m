//
//  WWWHTTPManager.m
//  AF第三方试用
//
//  Created by Mr.555 on 16/2/25.
//  Copyright © 2016年 Mr.555. All rights reserved.
//

#import "WWWHTTPManager.h"
#define WWWBaseURL [NSURL URLWithString:@"http://c.m.163.com/nc/"]
@implementation WWWHTTPManager
+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    static WWWHTTPManager *instace;
    dispatch_once(&onceToken, ^{
    
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15;
        instace.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"plant/html",nil];
        instace = [[self alloc]initWithBaseURL:WWWBaseURL sessionConfiguration:config];
        
    });
    return instace;
}
- (void)GET:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
    [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comlete(YES, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comlete(NO,error);
    }];
}

- (void)POST:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
    [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comlete(YES, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comlete(NO,error);
    }];
    
}
@end
