//
//  MKWNetworkReachableManager.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWNetworkReachableManager.h"
#import <AFNetworking/AFNetworking.h>

NSString *const kMKWNetWorkStatusChangedNotification = @"MKWNetWorkStatusChangedNotification";
NSString *const kMKWNetWorkStatusKey = @"MKWNetWorkStatusKey";

typedef NS_ENUM(NSInteger,MKWNetworkReachableAction) {
    MKWNetworkReachableActionNone,
    MKWNetworkReachableActionNotification,
    MKWNetworkReachableActionBlock,
};

@interface MKWNetworkReachableManager ()

@property (nonatomic, copy) void(^block)(AFNetworkReachabilityStatus status);

@property (nonatomic, strong) AFNetworkReachabilityManager *manager;

@property (nonatomic, assign) MKWNetworkReachableAction action;

@end

@implementation MKWNetworkReachableManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        _manager = manager;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_receiveNetworkChangeNotification:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    }
    return self;
}

- (void)monitorNetworkReachableChangedByNotification
{
    [self _startMonitorNetworkByAction:MKWNetworkReachableActionNotification];
}

- (void)monitorNetworkReachableChangedWithBlock:(void (^)(AFNetworkReachabilityStatus status))block
{
    self.block = block;
    [self _startMonitorNetworkByAction:MKWNetworkReachableActionBlock];
}

- (void)stopMonitor
{
    [self.manager stopMonitoring];
    _action = MKWNetworkReachableActionNone;
}

- (BOOL)isReachable
{
    return self.manager.isReachable;
}

- (BOOL)isReachableViaWiFi
{
    return self.manager.isReachableViaWiFi;
}

- (BOOL)isReachableViaWWAN
{
    return self.manager.isReachableViaWWAN;
}

#pragma mark - 私有方法

- (void)_startMonitorNetworkByAction:(MKWNetworkReachableAction)action
{
    if (action | _action) {
        return;
    }
    _action |= action;
    [self.manager startMonitoring];
}

- (void)_receiveNetworkChangeNotification:(NSNotification *)notice
{
    AFNetworkReachabilityStatus status = self.manager.networkReachabilityStatus;
    switch (_action) {
        case MKWNetworkReachableActionBlock:
            if (_block) {
                _block(status);
            }
            break;
        case MKWNetworkReachableActionNotification:
            [[NSNotificationCenter defaultCenter] postNotificationName:kMKWNetWorkStatusChangedNotification object:nil userInfo:@{kMKWNetWorkStatusKey : @(status)}];
            break;
        default:
            break;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
