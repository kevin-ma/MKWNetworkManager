//
//  URLHelper.h
//  Pods
//
//  Created by enuola on 16/5/10.
//
//

#import <Foundation/Foundation.h>

/**
 *  URL 解析类
 */
@interface URLHelper : NSObject

/**
 *  scheme
 */
@property (strong, nonatomic, readonly) NSString *scheme;

/**
 *  host
 */
@property (strong, nonatomic, readonly) NSString *host;

/**
 *  path
 */
@property (strong, nonatomic, readonly) NSString *path;

/**
 *  URL 中的参数列表
 */
@property (strong, nonatomic, readonly) NSDictionary *params;

/**
 *  URL String
 */
@property (strong, nonatomic, readonly) NSString *absoluteString;

/**
 *  从 URL 字符串创建 URLEntity
 *
 *  @param urlString url
 *
 *  @return 对应的 URLEntity
 */
+ (instancetype)URLWithString:(NSString * _Nonnull)urlString;

@end
