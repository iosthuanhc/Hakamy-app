//
//  MediaModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaModel : NSObject{
    NSString *_id;
    NSString *title;
    NSString *genre;
    BOOL isplaying;
}
@property (nonatomic ,assign) BOOL isplaying;
@property (nonatomic ,retain) NSString *_id;
@property (nonatomic ,retain) NSString *title;
@property (nonatomic ,retain) NSString *genre;

-(id)initWithJSON:(NSDictionary *)dic;
@end
