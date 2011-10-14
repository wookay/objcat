//
//  Logger.m
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import "Logger.h"
#import "StringExt.h"

void stdout_log_info(BOOL filename_lineno_flag, const char* filename, int lineno, id format, ...) {
#if LOGGER_OFF
	return;
#endif
	
	NSString* str = nil;
	if ([format isKindOfClass:[NSString class]]) {
		va_list args;
		va_start (args, format);
		str = [[NSString alloc] initWithFormat:format arguments:args];
		va_end (args);
	} else {
		str = [[NSString alloc] initWithString:[format description]];
	}
	
	BOOL log_print = true;	
#ifdef LOG_FILTER_HASPREFIX
	if (nil != LOG_FILTER_HASPREFIX) {
		log_print = [str hasPrefix:LOG_FILTER_HASPREFIX];
	}
#endif
	
	if (log_print) {		
		NSString* text = nil;
		if (filename_lineno_flag) {
			NSString* printFormat = [NSString stringWithFormat:@"%%%ds #%%03d   %%@\n", FILENAME_PADDING];
			text = [NSString stringWithFormat:printFormat, filename, lineno, str]; 
		} else {
			text = [NSString stringWithFormat:@"%@", str];
		}
		printf("%s", [text UTF8String]);
	}
}
