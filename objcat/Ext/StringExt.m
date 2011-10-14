//
//  StringExt.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "StringExt.h"

NSString* SWF(NSString* format, ...) {
  va_list args;
  va_start(args, format);
  NSString* str = [[NSString alloc] initWithFormat:format arguments:args];
  NSString* result = [NSString stringWithFormat:@"%@", str];
  va_end(args);
  return result;
}

NSArray* _w(NSString* str) {
    return [[str strip] componentsSeparatedByString:SPACE];
}

NSString* int_to_string(int n) {
    return [NSString stringWithFormat:@"%d", n];
}

@implementation NSString (StringExt)

-(NSNumber*) to_int_number {
    return [NSNumber numberWithInt:[self intValue]];
}

-(NSString*) strip {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
-(BOOL) hasText:(NSString*)str {
    NSRange range = [self rangeOfString:str];
    return NSNotFound != range.location;
}

-(unichar) to_unichar {
    return [self characterAtIndex:0];
}

-(NSArray*) chars {
    NSMutableArray* ary = [NSMutableArray array];
    int idx;
    for (idx = 0; idx < self.length; idx++) {
        NSRange range = NSMakeRange(idx, 1);
        NSString* ch = [self substringWithRange:range];
        [ary addObject:ch];
    }
    return ary;
}

-(NSArray*) split:(NSString*)separator {
    return [self componentsSeparatedByString:separator];
}
-(BOOL) include:(NSString*)str {
    NSRange range = [self rangeOfString:str];
    return NSNotFound != range.location;
}
@end
