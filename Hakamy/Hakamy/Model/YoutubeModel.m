//
//  YoutubeModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "YoutubeModel.h"

@implementation YoutubeModel
@synthesize src,imageurl,title;

-(id)initWithJSON:(NSDictionary *)dic{
    
    NSDictionary *titleDic=[dic objectForKey:@"title"];
    self.title=[titleDic objectForKey:@"$t"];
    NSDictionary *contentDic=[dic objectForKey:@"content"];
    self.src=[contentDic objectForKey:@"src"];
    
    NSDictionary *media$groupDic=[dic objectForKey:@"media$group"];
    NSArray *media$thumbnail=[media$groupDic objectForKey:@"media$thumbnail"];
    
    for (NSDictionary *tem in media$thumbnail) {
        self.imageurl=[tem objectForKey:@"url"];
    }
    
    return self;
}
@end
