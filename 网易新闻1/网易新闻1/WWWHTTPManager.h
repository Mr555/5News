//
//  WWWHTTPManager.h
//  AF第三方试用
//
//  Created by Mr.555 on 16/2/25.
//  Copyright © 2016年 Mr.555. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface WWWHTTPManager : AFHTTPSessionManager
+(instancetype)shareManager;
- (void)GET:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;
- (void)POST:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;
@end
