//
//  Logger.h
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>


#define FILENAME_PADDING 23
#define __FILENAME__ (strrchr(__FILE__,'/')+1)
#define log_info(const_chars_fmt, ...) stdout_log_info(1, __FILENAME__, __LINE__, const_chars_fmt, ##__VA_ARGS__)
#define print_log_info(const_chars_fmt, ...) stdout_log_info(0, __FILENAME__, __LINE__, const_chars_fmt, ##__VA_ARGS__)

#define PRINT_HERE log_info(@"%@", NSStringFromSelector(_cmd));

void stdout_log_info(BOOL filename_lineno_flag, const char* filename, int lineno, id format, ...) ;
