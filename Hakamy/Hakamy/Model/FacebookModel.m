//
//  FacebookModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "FacebookModel.h"

@implementation FacebookModel
//@synthesize textConten,updateDate;
@synthesize created_time,full_picture,messageFB,picture,story,typeFB,source;
-(id)initWithJSON:(NSDictionary *)dic{
    
    self.typeFB=[dic objectForKey:@"type"];
    self.story=[dic objectForKey:@"story"];
    self.created_time=[dic objectForKey:@"created_time"];
    self.picture=[dic objectForKey:@"picture"];
    self.full_picture=[dic objectForKey:@"full_picture"];
    self.messageFB=[dic objectForKey:@"message"];
    self.source=[dic objectForKey:@"source"];
//    self.textConten=[dic objectForKey:@"content"];
//    self.updateDate=[dic objectForKey:@"updated"];
    return self;
}
@end
