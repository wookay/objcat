// test_draw_shapes.m
//                           wookay.noh at gmail.com

#import "objcat.h"

NSString* draw_diamond(int n) ;
NSString* draw_pyramid(int n) ;

NSString* draw_diamond(int n) {
	return @"";
}

NSString* draw_pyramid(int n) {
	return @"";
}


@interface TestDrawShapes : NSObject
@end

@implementation TestDrawShapes

-(void) test_draw_diamond {
	assert_equal(@"\
 * \n\
***\n\
 * ", draw_diamond(3));
}

-(void) test_draw_pyramid {
	assert_equal(@"\
  *  \n\
 *** \n\
*****", draw_pyramid(3));
}

@end
