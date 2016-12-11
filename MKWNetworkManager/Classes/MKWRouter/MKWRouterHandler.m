//
//  MKWRouterHandler.m
//  VideoHeaven
//
//  Created by 凯文马 on 2016/12/11.
//  Copyright © 2016年 imeilin. All rights reserved.
//

#import "MKWRouterHandler.h"
#import <MKWFoundation/MGJRouter.h>
#import <MKWFoundation/URLHelper.h>
#import <MKWFoundation/MKWMacros.h>
#import <MKWFoundation/MKWObjectKit.h>

@implementation MKWRouterHandler

+ (void)load
{
    NSArray *sub = [self subclasses];
    for (Class cls in sub) {
        MKWRouterHandler *handler = [cls mkw_sharedInstance];
        NSArray *urls = [handler registerUrl];
        [handler startRegisterUrls:urls];
    }
}

- (NSArray *)registerUrl
{
    return nil;
}

- (void)startRegisterUrls:(NSArray *)urls
{
    if (!urls) return;
    for (NSString *url in urls) {
        @weakify(self);
        [MGJRouter registerURLPattern:url toHandler:^(NSDictionary *routerParameters) {
            @strongify(self);
            URLHelper *helper = [URLHelper URLWithString:url];
            [self handlerUrlWithUrl:helper userInfo:routerParameters[MGJRouterParameterUserInfo] completion:^(id result) {
                void(^com)(id) = routerParameters[MGJRouterParameterCompletion];
                if (com) {
                    com(result);
                }
            }];
        }];
    }
}

- (void)handlerUrlWithUrl:(URLHelper *)url userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion
{
    
}

@end
