//
//  MKWRouterHandler.h
//  VideoHeaven
//
//  Created by 凯文马 on 2016/12/11.
//  Copyright © 2016年 imeilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MKWFoundation/MKWObjectKit.h>
#import <MKWFoundation/URLHelper.h>

@interface MKWRouterHandler : NSObject <MKWSharedInstance>

- (NSArray *)registerUrl;

- (void)handlerUrlWithUrl:(URLHelper *)url userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion;

@end
