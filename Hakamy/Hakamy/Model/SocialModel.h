//
//  SocialModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/4/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialModel : NSObject{
    NSDate *dateVL;
    NSString *textConten;
    NSString *socialType;
    
    BOOL isFacebook;
}
@property (nonatomic ,retain) NSString *socialType;
@property (nonatomic ,assign) BOOL isFacebook;
@property (nonatomic ,retain) NSDate *dateVL;
@property (nonatomic ,retain) NSString *textConten;

@end
