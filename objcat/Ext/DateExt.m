//
//  DateExt.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "DateExt.h"

@implementation NSDate (DateExt)

-(NSString*) to_gmt_string {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString* str = [df stringFromDate:self];
    return str;
}

@end
