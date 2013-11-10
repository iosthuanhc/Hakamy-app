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
    NSString *story;
    NSString *picture;
    NSString *source;
    NSString *messageFB;
    BOOL isFacebook;
}
@property (nonatomic ,retain) NSString *story;
@property (nonatomic ,retain) NSString *picture;
@property (nonatomic ,retain) NSString *source;
@property (nonatomic ,retain) NSString *messageFB;
@property (nonatomic ,retain) NSString *socialType;
@property (nonatomic ,assign) BOOL isFacebook;
@property (nonatomic ,retain) NSDate *dateVL;
@property (nonatomic ,retain) NSString *textConten;

@end
