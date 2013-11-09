//
//  RssModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "RssModel.h"

@implementation RssModel
@synthesize _id,news_summry,news_thumb,timee,title;

-(id)initWithJSON:(NSDictionary *)dic{
    self._id=[dic objectForKey:@"id"];
    self.title=[dic objectForKey:@"title"];
    self.news_summry=[dic objectForKey:@"news_summry"];
    self.news_thumb=[dic objectForKey:@"news_thumb"];
    self.timee=[dic objectForKey:@"timee"];
    return self;
}
@end
