//
//  IntagramModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "IntagramModel.h"

@implementation IntagramModel
@synthesize url,full_name,username;

-(id)initWithJSON:(NSDictionary *)dic{
    self.url=[dic objectForKey:@"url"];
    self.username=[dic objectForKey:@"username"];
    self.full_name=[dic objectForKey:@"full_name"];
    return self;
}
@end
