//
//  MKWNetworkManager.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "MKWNetworkReachableManager.h"

@interface MKWNetworkManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) MKWURLSessionConfiguration *config;

@end

@implementation MKWNetworkManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.config = [MKWURLSessionConfiguration defaultSessionConfiguration];
        self.config.timeoutIntervalForRequest = 15;
    }
    return self;
}

- (void)setBaseUrl:(NSString *)baseUrl
{
    if (![baseUrl isEqualToString:_baseUrl]) {
        _baseUrl = [baseUrl copy];
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:_baseUrl sessionConfiguration:self.config];
        self.manager = manager;
    }
}

- (void)GETRequestWithUrl:(NSString *)url parameters:(nullable NSDictionary *)parameters config:(void(^)(MKWURLSessionConfiguration *currentConfig))config complete:(void(^)(NSError *error, id result))complete
{
    NSError *unreachableError = nil;
    AFHTTPSessionManager *manager = [self _managerWithConfig:config error:&unreachableError];
    if (unreachableError) {
        if (complete) {
            complete(unreachableError,nil);
        }
        return;
    }
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (complete) {
            complete(nil,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (complete) {
            complete(error,nil);
        }
    }];
}

#pragma mark - private

- (AFHTTPSessionManager *)_managerWithConfig:(void(^)(MKWURLSessionConfiguration *currentConfig))config error:(NSError **)error
{
    BOOL *unreachable = NO;
    if (![[MKWNetworkReachableManager mkw_sharedInstance] isReachable]) {
        unreachable = YES;
    }
    
    AFHTTPSessionManager *manager = self.manager;
    if (config) {
        MKWURLSessionConfiguration *configCopy = [self.config copy];
        config(configCopy);
        if (unreachable) {
            *error = [self _unreachableErrorWithMessage:configCopy.unreachableMessage];
            return nil;
        }
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseUrl sessionConfiguration:configCopy];
    } else if (unreachable) {
        *error = [self _unreachableErrorWithMessage:nil];
        return nil;
    }
    return manager;
}

- (NSError *)_unreachableErrorWithMessage:(NSString *)message
{
    if (!message) {
        message = self.unreachableMessage;
    }
    return [NSError errorWithDomain:message code:250 userInfo:nil];
}
@end
