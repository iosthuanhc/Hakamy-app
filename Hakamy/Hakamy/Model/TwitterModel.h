//
//  TwitterModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterModel : NSObject{
    NSString *created_at;
    NSString *title;
}
@property (nonatomic ,retain) NSString *created_at;
@property (nonatomic ,retain) NSString *title;
-(id)initWithJSON:(NSDictionary *)dic;
@end
