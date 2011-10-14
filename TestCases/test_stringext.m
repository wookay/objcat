// test_stringext.m
//                           wookay.noh at gmail.com

#import "objcat.h"

@interface TestStringExt : NSObject
@end

@implementation TestStringExt

-(void) test_string_empty {
    assert_equal(@"", STRING_EMPTY);
}

-(void) test_string_include {
    assert_true([@"druid" include:@"id"]);
}

@end
