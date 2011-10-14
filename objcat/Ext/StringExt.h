//
//  StringExt.h
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SPACE            @" "
#define LF               @"\n"
#define TAB              @"\t"
#define AMP              @"&"
#define AT_SIGN			 @"@"
#define EQUAL            @"="
#define COLON            @":"
#define SEMICOLON		 @";"
#define SEMICOLON_SPACE	 @"; "
#define COMMA            @","
#define UNDERBAR		 @"_"
#define COMMA_SPACE		 @", "
#define COMMA_LF		 @",\n"
#define DOT              @"."
#define DOT_SPACE		 @". "
#define DOT_DOT			 @".."
#define STAR             @"*"
#define SLASH			 @"/"
#define PLUS             @"+"
#define PIPE             @"|"
#define MINUS			 @"-"
#define QUESTION_MARK    @"?"
#define EXCLAMATION_MARK @"!"
#define DOLLAR			 @"$"
#define TILDE			 @"~"
#define	LESS_THAN        @"<"
#define	GREATER_THAN     @">"
#define OPENING_BRACE	 @"{"
#define CLOSING_BRACE	 @"}"
#define OPENING_PARENTHESE		@"("
#define CLOSING_PARENTHESE		@")"
#define OPENING_SQUARE_BRACKET  @"["
#define CLOSING_SQUARE_BRACKET  @"]"
#define DOUBLE_QUOTATION_MARK	@"\""
#define SINGLE_QUOTATION_MARK	@"'"

#define CHAR_BACKSPACE	 '\b'
#define CHAR_MINUS       '-'

#define STRING_EMPTY    @""
#define STRING_TRUE		@"true"
#define STRING_FALSE	@"false"
#define STRING_NIL		@"nil"

NSString* SWF(NSString* format, ...) ;
NSArray* _w(NSString* str) ;
NSString* int_to_string(int n) ;

@interface NSString (StringExt)
-(NSNumber*) to_int_number ;
-(NSString*) strip ;
-(BOOL) hasText:(NSString*)str ;
-(unichar) to_unichar ;
-(NSArray*) chars ;
-(NSArray*) split:(NSString*)separator ;
-(BOOL) include:(NSString*)str ;
@end
