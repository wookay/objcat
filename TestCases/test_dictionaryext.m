// test_dictionaryext.m
//                           wookay.noh at gmail.com

#import "objcat.h"

@interface TestDictionaryExt : NSObject
@end

@implementation TestDictionaryExt

-(void) test_dictionary_count {
    assert_equal(0, [[NSDictionary dictionary] count]);
    
    NSDictionary* expected = [NSDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil];
    NSDictionary* got = [NSDictionary dictionaryWithKeysAndObjects:@"key", @"value", nil];
    assert_equal(expected, got);
}

@end
