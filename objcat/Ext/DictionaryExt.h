//
//  DictionaryExt.h
//  objcat
//
//  Created by WooKyoung Noh on 06/09/11.
//  Copyright 2011 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DictionaryExt)
-(NSArray*) sortKeys ;
-(BOOL) hasKey:(id)key ;
+(id) dictionaryWithKeysAndObjects:(id)firstKey, ... ;
@end
