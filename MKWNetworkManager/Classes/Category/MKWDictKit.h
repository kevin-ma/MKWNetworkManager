//
//  MKWDictKit.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (mkw_safe)

- (id)mkw_objectForKey:(id)aKey;

@end

@interface NSMutableDictionary (mkw_safe)

- (void)mkw_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
