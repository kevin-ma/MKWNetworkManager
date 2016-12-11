//
//  MKWObjectKit.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWObjectKit.h"
#import <objc/runtime.h>

@implementation NSObject (mkw_instance)

+ (instancetype)mkw_sharedInstance
{
    if ([self conformsToProtocol:NSProtocolFromString(@"MKWSharedInstance")]) {
        static id _obj = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _obj = [[self alloc] init];
        });
        return _obj;
    } else {
        return nil;
    }
}

@end

@implementation NSObject (mkw_subclass)

+ (NSArray *)subclasses
{
    NSMutableArray *subClass = [@[] mutableCopy];
    unsigned int numCls;
    Class *classes = objc_copyClassList(&numCls);
    for (unsigned int ci = 0; ci < numCls; ci++) {
        Class superClass = classes[ci];
        do {
            superClass = class_getSuperclass(superClass);
        } while (superClass && superClass != self);
        if (superClass) {
            [subClass addObject:classes[ci]];
        }
    }
    free(classes);
    return subClass;
}


- (NSArray *)subclasses
{
    return [[self class] subclasses];
}
@end
