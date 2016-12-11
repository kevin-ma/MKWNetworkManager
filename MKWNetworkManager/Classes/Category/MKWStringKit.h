//
//  MKWStringKit.h
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>

@interface NSString (mks_safe)

- (NSString *)mkw_md5HashString;

- (NSString *)mkw_base64encode;

@end

@interface NSString (mks_url)

/**
 *  根据 BaseURL 和一些参数组合成一个完整的 URL
 *
 *  @param baseURL
 *  @param parameters
 *
 *  @return
 */
+ (NSString *)mkw_combineURLWithBaseURL:(NSString *)baseURL parameters:(NSDictionary *)parameters;

- (NSString *)mkw_urlencode;

- (NSString *)mkw_urldecode;

@end

@interface NSString (mkw_path)

/**
 *  Library/Caches
 */
+ (NSString *)mkw_cachesPath;

/**
 *  Library/Documents
 */
+ (NSString *)mkw_documentsPath;

/**
 *  获取临时目录，模拟器状态下会返回 /tmp
 */
+ (NSString *)mkw_temporaryPath;

/**
 *  根据 UUID 创建一个临时文件路径，每次调用都会返回不同的结果
 */
+ (NSString *)mkw_pathForTemporaryFile;

@end

@interface NSString (mkw_common)

+ (NSString *)mkw_UUID;

/**
 *  把 char 字符转换为 OC 的字符串，比如 int value = 'test', 调用此方法后可以得到 @"test"
 *
 *  @param charInt 一个 char, 比如 'foo'
 */
+ (NSString *)mkw_convertToStringWithChar:(NSInteger)charInt;

- (NSString *)mkw_trim;

@end

