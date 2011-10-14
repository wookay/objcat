//
//  ObjectExt.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "ObjectExt.h"
#import "ArrayExt.h"
#import <objc/message.h>

@implementation NSObject (ObjectExt)

-(NSArray*) methodNames {
    return [NSObject methodNamesForClass:[self class]];
}

+(NSArray*) methodNamesForClass:(Class)targetClass {
    NSMutableArray* ary = [NSMutableArray array];
    unsigned int count;
    Method *methods = class_copyMethodList((Class)targetClass, &count);
    for (size_t idx = 0; idx < count; ++idx) {
        Method method = methods[idx];
        SEL selector = method_getName(method);
        NSString *selectorName = NSStringFromSelector(selector);
        [ary addObject:selectorName];
    }
    free(methods);
    return [ary sort];
}

+(id) objectWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription {
	if (_C_PTR == *aTypeDescription && nil == *(__unsafe_unretained id *)aValue) {
		return nil;
	}
	switch (*aTypeDescription) {
		case _C_CHR: // BOOL, char
			if (1 == (size_t)aValue) {
				return [NSNumber numberWithBool:TRUE];
			} else if (NULL == aValue) {
				return [NSNumber numberWithBool:FALSE];
			} else {
				return [NSNumber numberWithChar:*(char *)aValue];
			}
		case _C_UCHR: return [NSNumber numberWithUnsignedChar:*(unsigned char *)aValue];
		case _C_SHT: return [NSNumber numberWithShort:*(short *)aValue];
		case _C_USHT: return [NSNumber numberWithUnsignedShort:*(unsigned short *)aValue];
		case _C_INT: 
			return [NSNumber numberWithInt:*(int *)aValue];
		case _C_UINT: return [NSNumber numberWithUnsignedInt:*(unsigned *)aValue];
		case _C_LNG: return [NSNumber numberWithLong:*(long *)aValue];
		case _C_ULNG: return [NSNumber numberWithUnsignedLong:*(unsigned long *)aValue];
		case _C_LNG_LNG: return [NSNumber numberWithLongLong:*(long long *)aValue];
		case _C_ULNG_LNG: return [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)aValue];
		case _C_FLT:
			return [NSNumber numberWithFloat:*(float *)aValue];
		case _C_DBL: return [NSNumber numberWithDouble:*(double *)aValue];
		case _C_ID:
			if (nil == aValue) {
				return nil;
			} else {
				return *(__unsafe_unretained id *)aValue;
			}
		case _C_PTR: // pointer, no string stuff supported right now
		case _C_STRUCT_B: // struct, only simple ones containing only basic types right now
		case _C_ARY_B: // array, of whatever, just gets the address
			if (NULL == aValue) {
				return nil;
			} else {
				return [NSValue valueWithBytes:aValue objCType:aTypeDescription];
			}
	}
	return [NSValue valueWithBytes:aValue objCType:aTypeDescription];	
}

@end
