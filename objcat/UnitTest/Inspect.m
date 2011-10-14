//
//  Inspect.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "Inspect.h"
#import "StringExt.h"

@interface NSFormatterToInspect : NSFormatter
-(NSString*) stringForObject:(id)anObject ;
-(NSString*) stringForArray:(NSArray*)anArray ;
@end

NSString* inspect(id obj) {
    if (nil == obj) {
        return STRING_NIL;
    } else if ([obj isKindOfClass:[NSObject class]]) {
        NSFormatterToInspect* formatter = [[NSFormatterToInspect alloc] init];
        NSString* str = [formatter stringForObject:obj];
        return str;
    } else {
        return STRING_EMPTY;
    }
}





@implementation NSFormatterToInspect

-(NSString*) stringForObject:(id)anObject {
    if ([anObject isKindOfClass:[NSArray class]]) {
        return [self stringForArray:anObject];
    } else if ([anObject isKindOfClass:[NSSet class]]) {
        return [self stringForArray:[anObject allObjects]];
    } else if ([anObject isKindOfClass:[NSDictionary class]]) {
        NSMutableArray* ary = [NSMutableArray array];
        for (id key in anObject) {
            id obj = [anObject objectForKey:key];
            [ary addObject:SWF(@"%@ : %@", inspect(key), inspect(obj))];        
        }
        return SWF(@"{%@}", [ary componentsJoinedByString:COMMA_LF]);
    } else if ([anObject isKindOfClass:[NSString class]]) {
        return SWF(@"\"%@\"", anObject);
    } else {
        return SWF(@"%@", anObject);
    }
}

-(NSString*) stringForArray:(NSArray*)anArray {
    switch (anArray.count) {
        case 1:
            return SWF(@"[%@]", inspect([anArray lastObject]));
            break;
        default: {
#define OVER_LINE_LIMIT 80
            int overLine = 0;
            NSMutableArray* ary = [NSMutableArray array];
            for (id obj in anArray) {
                NSString* str = SWF(@"%@", inspect(obj));
                [ary addObject:str];
                if (OVER_LINE_LIMIT > overLine) {
                    overLine += str.length;
                }
            }
            if (OVER_LINE_LIMIT > overLine) {
                return SWF(@"[%@]", [ary componentsJoinedByString:COMMA_SPACE]);      
            } else {
                NSMutableArray* indentedArray = [NSMutableArray array];
                for (id obj in  ary) {
                    [indentedArray addObject:SWF(@"  %@", obj)];
                }
                return SWF(@"[\n%@\n]", [indentedArray componentsJoinedByString:COMMA_LF]);      
            }
        }
            break;
    }
}

@end
