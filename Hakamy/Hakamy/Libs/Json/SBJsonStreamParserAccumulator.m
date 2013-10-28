//
//  SBJson.h
//  LearningEnglish
//
//  Created by Hà công  Thuận on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBJsonStreamParserAccumulator.h"

@implementation SBJsonStreamParserAccumulator

@synthesize value;


#pragma mark SBJsonStreamParserAdapterDelegate

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray *)array {
	value = array;
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary *)dict {
	value = dict;
}

@end
