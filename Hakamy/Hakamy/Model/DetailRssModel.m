//
//  DetailRssModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "DetailRssModel.h"

@implementation DetailRssModel
@synthesize news_full,title,_id,full_pic;

-(id)initWithJSON:(NSDictionary *)dic{
    self._id=[dic objectForKey:@"id"];
    self.title=[dic objectForKey:@"title"];
    self.news_full=[dic objectForKey:@"news_full"];
    self.full_pic=[dic objectForKey:@"full_pic"];
    return self;
}
@end
