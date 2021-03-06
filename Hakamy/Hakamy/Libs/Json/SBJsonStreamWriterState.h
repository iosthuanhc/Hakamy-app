//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBJsonStreamWriter;

@interface SBJsonStreamWriterState : NSObject
+ (id)sharedInstance;
- (BOOL)isInvalidState:(SBJsonStreamWriter*)writer;
- (void)appendSeparator:(SBJsonStreamWriter*)writer;
- (BOOL)expectingKey:(SBJsonStreamWriter*)writer;
- (void)transitionState:(SBJsonStreamWriter*)writer;
- (void)appendWhitespace:(SBJsonStreamWriter*)writer;
@end

@interface SBJsonStreamWriterStateObjectStart : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateObjectKey : SBJsonStreamWriterStateObjectStart
@end

@interface SBJsonStreamWriterStateObjectValue : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateArrayStart : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateArrayValue : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateStart : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateComplete : SBJsonStreamWriterState
@end

@interface SBJsonStreamWriterStateError : SBJsonStreamWriterState
@end

