//
//  DetailRssModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailRssModel : NSObject{
    NSString *_id;
    NSString *title;
    NSString *news_full;
    NSString *full_pic;
    NSString *timeDetai;
    
}
@property(nonatomic ,retain) NSString *_id;
@property(nonatomic ,retain) NSString *title;
@property(nonatomic ,retain) NSString *news_full;
@property(nonatomic ,retain) NSString *full_pic;
@property(nonatomic ,retain) NSString *timeDetai;
-(id)initWithJSON:(NSDictionary *)dic;
@end
