//
//  RssModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RssModel : NSObject{
    NSString *_id;
    NSString *title;
    NSString *news_summry;
    NSString *news_thumb;
    NSString *timee;
}
@property(nonatomic ,retain) NSString *_id;
@property(nonatomic ,retain) NSString *title;
@property(nonatomic ,retain) NSString *news_summry;
@property(nonatomic ,retain) NSString *news_thumb;
@property(nonatomic ,retain) NSString *timee;

-(id)initWithJSON:(NSDictionary *)dic;
@end
