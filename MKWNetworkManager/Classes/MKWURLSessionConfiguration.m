//
//  MKWURLSessionConfiguration.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWURLSessionConfiguration.h"

@implementation MKWURLSessionConfiguration

+ (NSURLSessionConfiguration *)defaultSessionConfiguration
{
    MKWURLSessionConfiguration *config = [super defaultSessionConfiguration];
    config.unreachableMessage = @"无法连接到服务器";
    return config;
}

- (id)copyWithZone:(NSZone *)zone
{
    MKWURLSessionConfiguration *config = [super copyWithZone:zone];
    config.unreachableMessage = self.unreachableMessage;
    return config;
}

@end
