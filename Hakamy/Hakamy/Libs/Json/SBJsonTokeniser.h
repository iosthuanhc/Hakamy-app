//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef enum {
    sbjson_token_error = -1,
    sbjson_token_eof,
    
    sbjson_token_array_start,
    sbjson_token_array_end,
    
    sbjson_token_object_start,
    sbjson_token_object_end,

    sbjson_token_separator,
    sbjson_token_keyval_separator,
    
    sbjson_token_number,
    sbjson_token_string,
    sbjson_token_true,
    sbjson_token_false,
    sbjson_token_null,
    
} sbjson_token_t;

@class SBJsonUTF8Stream;

@interface SBJsonTokeniser : NSObject 

@property (strong) SBJsonUTF8Stream *stream;
@property (copy) NSString *error;

- (void)appendData:(NSData*)data_;

- (sbjson_token_t)getToken:(NSObject**)token;

@end
