//
//  DictionaryExt.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "DictionaryExt.h"
#import "ArrayExt.h"

@implementation NSDictionary (DictionaryExt)

-(NSArray*) sortKeys {
    return [[self allKeys] sort];
}

-(BOOL) hasKey:(id)key {
    NSEnumerator* enumerator = [self keyEnumerator];
    id k;
    while ((k = [enumerator nextObject])) {
        if ([k isEqual:key]) {
            return true;
        }
    }
    return false;
}

+(id) dictionaryWithKeysAndObjects:(id)firstKey, ... {
    NSMutableArray* keys = [NSMutableArray array];
    NSMutableArray* objects = [NSMutableArray array];
    id obj = firstKey;
    va_list args;
    va_start(args, firstKey);
    int idx = 0;
    while (nil != obj) {
        if (0 == idx%2) {
            [keys addObject:obj];
        } else {
            [objects addObject:obj];
        }
        obj = va_arg(args, id);
        idx += 1;
    }
    va_end(args);
    return [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}

@end