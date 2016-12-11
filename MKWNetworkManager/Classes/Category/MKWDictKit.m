//
//  MKWDictKit.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWDictKit.h"

@implementation NSDictionary (mkw_safe)

- (id)mkw_objectForKey:(id)aKey
{
    if (aKey) {
        return [self objectForKey:aKey];
    }
    return nil;
}

@end

@implementation NSMutableDictionary (mkw_safe)

- (void)mkw_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
