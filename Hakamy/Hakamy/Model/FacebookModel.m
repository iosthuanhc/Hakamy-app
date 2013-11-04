//
//  FacebookModel.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "FacebookModel.h"

@implementation FacebookModel
@synthesize textConten,updateDate;

-(id)initWithJSON:(NSDictionary *)dic{
    self.textConten=[dic objectForKey:@"content"];
    self.updateDate=[dic objectForKey:@"updated"];
    return self;
}
@end
