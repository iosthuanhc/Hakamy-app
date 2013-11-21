//
//  YoutubeModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeModel : NSObject{
    NSString *src;
    NSString *youtubeID;
    NSString *title;
    NSString *imageurl;
}
@property (nonatomic ,retain) NSString *youtubeID;
@property (nonatomic ,retain) NSString *src;
@property (nonatomic ,retain) NSString *title;
@property (nonatomic ,retain) NSString *imageurl;
-(id)initWithJSON:(NSDictionary *)dic;

@end
