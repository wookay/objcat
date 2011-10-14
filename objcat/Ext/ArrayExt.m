//
//  ArrayExt.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "ArrayExt.h"

@implementation NSArray (ArrayExt)

-(id) objectAtFirst {
    return [self objectAtIndex:0];
}

-(id) objectAtSecond {
    return [self objectAtIndex:1];
}

-(NSString*) join:(NSString*)separator {
    return [self componentsJoinedByString:separator]; 
}

-(NSArray*) sort {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

@end
