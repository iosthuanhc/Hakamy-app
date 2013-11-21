//
//  YoutubeModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "YoutubeModel.h"

@implementation YoutubeModel
@synthesize src,imageurl,title,youtubeID;

-(id)initWithJSON:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        NSDictionary *titleDic=[dic objectForKey:@"title"];
        self.title=[titleDic objectForKey:@"$t"];
        NSDictionary *contentDic=[dic objectForKey:@"content"];
        self.src=[contentDic objectForKey:@"src"];
        NSDictionary *idyotube=[dic objectForKey:@"id"];
        NSString *temID=[idyotube objectForKey:@"$t"];
        NSArray *arrayPath = [[NSArray alloc] initWithArray:[temID componentsSeparatedByString:@":"]];
        self.youtubeID=[arrayPath objectAtIndex:arrayPath.count-1];
        NSDictionary *media$groupDic=[dic objectForKey:@"media$group"];
        NSArray *media$thumbnail=[media$groupDic objectForKey:@"media$thumbnail"];
        
        for (NSDictionary *tem in media$thumbnail) {
            self.imageurl=[tem objectForKey:@"url"];
        }
    }
    return self;
}
@end
