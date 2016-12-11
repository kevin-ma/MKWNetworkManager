//
//  MKWObjectKit.h
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>

@protocol MKWSharedInstance <NSObject>

+ (instancetype)mkw_sharedInstance;

@end

@interface NSObject (mkw_instance)

@end

@interface NSObject (mkw_subclass)

+ (NSArray *)subclasses;

- (NSArray *)subclasses;
@end
