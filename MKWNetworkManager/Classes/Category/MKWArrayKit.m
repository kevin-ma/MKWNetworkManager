//
//  NSArray+MKW.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWArrayKit.h"

@implementation NSArray (mkw_safe)

- (id)mkw_objectAtIndex:(NSUInteger)index
{
    if (index > 0 && index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end

@implementation NSMutableArray (mkw_safe)

- (void)mkw_addObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)mkw_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
}

@end
