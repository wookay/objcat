//
//  ArrayExt.h
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define array1(one) [NSArray arrayWithObject:one]
#define array2(one,two) [NSArray arrayWithObjects:one,two,nil]
#define array3(one,two,three) [NSArray arrayWithObjects:one,two,three,nil]
#define array4(one,two,three,four) [NSArray arrayWithObjects:one,two,three,four,nil]

#define PAIR array2
#define TRIO array3
#define CUAD array4

@interface NSArray (ArrayExt)
-(id) objectAtFirst ;
-(id) objectAtSecond ;
-(NSString*) join:(NSString*)separator ;
-(NSArray*) sort ;
@end
