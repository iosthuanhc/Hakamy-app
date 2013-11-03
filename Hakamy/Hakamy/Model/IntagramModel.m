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
    NSDictionary *dicimage=[dic objectForKey:@"images"];
    NSDictionary *detailImageDic=[dicimage objectForKey:@"low_resolution"];
    self.url=[detailImageDic objectForKey:@"url"];
    NSDictionary *userDic=[dic objectForKey:@"user"];
    self.username=[userDic objectForKey:@"username"];
    self.full_name=[userDic objectForKey:@"full_name"];
    return self;
}
@end
