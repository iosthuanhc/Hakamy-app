//
//  MediaModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "MediaModel.h"

@implementation MediaModel
@synthesize _id,genre,title,isplaying;

-(id)initWithJSON:(NSDictionary *)dic{
    self._id=[dic objectForKey:@"id"];
    self.title=[dic objectForKey:@"title"];
    self.genre=[dic objectForKey:@"genre"];
    return self;
}
@end
