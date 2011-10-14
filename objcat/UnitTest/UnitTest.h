//
//  UnitTest.h
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectExt.h"

#define __FILENAME__ (strrchr(__FILE__,'/')+1)

#define assert_equal(expected, got) \
 do { \
	__typeof__(expected) __expected = (expected); \
	__typeof__(got) __got = (got); \
	NSValue* expected_encoded = [NSObject objectWithValue:&__expected withObjCType: @encode(__typeof__(expected))]; \
	NSValue* got_encoded = [NSObject objectWithValue:&__got withObjCType: @encode(__typeof__(got))]; \
	[UnitTest assert:got_encoded equals:expected_encoded inFile:[NSString stringWithUTF8String:__FILENAME__] atLine:__LINE__]; \
} while(0)

#define assert_equal_message(expected, got, expected_message) \
do { \
	__typeof__(expected) __expected = (expected); \
	__typeof__(got) __got = (got); \
	NSValue* expected_encoded = [NSObject objectWithValue:&__expected withObjCType: @encode(__typeof__(expected))]; \
	NSValue* got_encoded = [NSObject objectWithValue:&__got withObjCType: @encode(__typeof__(got))]; \
	[UnitTest assert:got_encoded equals:expected_encoded message:expected_message inFile:[NSString stringWithUTF8String:__FILENAME__] atLine:__LINE__]; \
} while(0)

#define assert_true(expr) assert_equal_message(true, expr, @"true")
#define assert_false(expr) assert_equal_message(false, expr, @"false")
#define assert_nil(expr) assert_equal_message(true, nil == expr, @"nil")
#define assert_not_nil(expr) assert_equal_message(false, nil == expr, @"not nil")
#define assert_not_null(expr) assert_equal_message(false, NULL == expr, @"not NULL")
#define assert_not_equals(not_expected, got) assert_equal_message(false, not_expected == got, @"not equals")

typedef void (^AssertBlock)();
#define assert_raise(exceptionName, block) \
do { \
	[UnitTest assertBlock:block raise:exceptionName inFile:[NSString stringWithUTF8String:__FILENAME__] atLine:__LINE__]; \
} while(0)


@interface UnitTest : NSObject
+(void) run ;
+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line ;
+(void) assert:(NSValue*)got equals:(NSValue*)expected message:(NSString*)message inFile:(NSString*)file atLine:(int)line ;
@end
