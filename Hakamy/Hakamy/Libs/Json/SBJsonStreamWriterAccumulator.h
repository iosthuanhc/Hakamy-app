//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBJsonStreamWriter.h"

@interface SBJsonStreamWriterAccumulator : NSObject <SBJsonStreamWriterDelegate>

@property (readonly, copy) NSMutableData* data;

@end
