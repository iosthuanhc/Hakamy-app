//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SBJsonUTF8Stream : NSObject {
@private
    const char *_bytes;
    NSMutableData *_data;
    NSUInteger _length;
}

@property (assign) NSUInteger index;

- (void)appendData:(NSData*)data_;

- (BOOL)haveRemainingCharacters:(NSUInteger)chars;

- (void)skip;
- (void)skipWhitespace;
- (BOOL)skipCharacters:(const char *)chars length:(NSUInteger)len;

- (BOOL)getUnichar:(unichar*)ch;
- (BOOL)getNextUnichar:(unichar*)ch;
- (BOOL)getStringFragment:(NSString**)string;

- (NSString*)stringWithRange:(NSRange)range;

@end
