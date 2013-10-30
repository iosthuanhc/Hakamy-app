//
//  TwitterModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "TwitterModel.h"

@implementation TwitterModel
@synthesize created_at,title;

-(id)initWithJSON:(NSDictionary *)dic{
    
    self.title=[dic objectForKey:@"text"];
    self.created_at=[dic objectForKey:@"created_at"];
    return self;
}
@end
