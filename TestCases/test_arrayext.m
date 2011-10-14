// test_arrayext.m
//                           wookay.noh at gmail.com

#import "objcat.h"

@interface TestArrayExt : NSObject
@end

@implementation TestArrayExt

-(void) test_array_count {
    assert_equal(0, [[NSArray array] count]);
}

-(void) test_array_join {
    NSArray* ary = [@"a b c" split:SPACE];
    NSArray* expected = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    assert_equal(expected, ary);
    assert_equal(@"a, b, c", [ary join:COMMA_SPACE]);
}

@end