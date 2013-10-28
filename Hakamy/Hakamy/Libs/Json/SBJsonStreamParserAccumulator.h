//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJsonStreamParserAdapter.h"

@interface SBJsonStreamParserAccumulator : NSObject <SBJsonStreamParserAdapterDelegate>

@property (copy) id value;

@end
