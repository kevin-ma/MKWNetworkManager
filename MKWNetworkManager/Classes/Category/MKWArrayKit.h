//
//  NSArray+MKW.h
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (mkw_safe)

- (id)mkw_objectAtIndex:(NSUInteger)index;


@end


@interface NSMutableArray (mkw_safe)

- (void)mkw_addObject:(id)anObject;

- (void)mkw_insertObject:(id)anObject atIndex:(NSUInteger)index;
@end
