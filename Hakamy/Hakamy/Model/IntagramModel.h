//
//  IntagramModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntagramModel : NSObject{
    NSString *url;
    NSString *username;
    NSString *full_name;
}
@property (nonatomic ,retain) NSString *url;
@property (nonatomic ,retain) NSString *username;
@property (nonatomic ,retain) NSString *full_name;

-(id)initWithJSON:(NSDictionary *)dic;

@end
