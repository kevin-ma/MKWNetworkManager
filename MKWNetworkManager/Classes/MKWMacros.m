//
//  MKWMacros.m
//  Pods
//
//  Created by 凯文马 on 2016/12/11.
//
//

#import "MKWMacros.h"

BOOL isEmptyString(NSString *string)
{
    return (![string isKindOfClass:[NSString class]] || (!string || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]));
}

NSString *intString(NSInteger value)
{
    return [NSString stringWithFormat:@"%d",value];
}

NSString *floatString(CGFloat value)
{
    return [NSString stringWithFormat:@"%f",value];
}
