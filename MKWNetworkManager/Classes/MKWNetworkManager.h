//
//  MKWNetworkManager.h
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>
#import <MKWFoundation/MKWObjectKit.h>
#import "MKWURLSessionConfiguration.h"

@interface MKWNetworkManager : NSObject <MKWSharedInstance>

@property (nonatomic, copy) NSString *baseUrl;

@property (nonatomic, copy) NSString *unreachableMessage;

- (void)GETRequestWithUrl:(NSString *)url parameters:(nullable NSDictionary *)parameters config:(void(^)(MKWURLSessionConfiguration *currentConfig))config complete:(void(^)(NSError *error, id result))complete;

- (void)POSTRequestWithUrl:(NSString *)url parameters:(nullable NSDictionary *)parameters config:(void(^)(MKWURLSessionConfiguration *currentConfig))config complete:(void(^)(NSError *error, id result))complete;


@end
