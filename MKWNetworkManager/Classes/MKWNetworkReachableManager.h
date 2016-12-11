//
//  MKWNetworkReachableManager.h
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>
#import <MKWFoundation/MKWObjectKit.h>
#import "AFNetworkReachabilityManager.h"

UIKIT_EXTERN NSString *const kMKWNetWorkStatusChangedNotification;
UIKIT_EXTERN NSString *const kMKWNetWorkStatusKey;

@interface MKWNetworkReachableManager : NSObject <MKWSharedInstance>

- (void)monitorNetworkReachableChangedByNotification;

- (void)monitorNetworkReachableChangedWithBlock:(void(^)(AFNetworkReachabilityStatus status))block;

- (void)stopMonitor;

- (AFNetworkReachabilityStatus)status;

- (BOOL)isReachable;

- (BOOL)isReachableViaWWAN;

- (BOOL)isReachableViaWiFi;

@end
