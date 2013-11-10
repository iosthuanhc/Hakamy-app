//
//  FacebookModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookModel : NSObject{
//    NSString *updateDate;
//    NSString *textConten;
    NSString *typeFB;
    NSString *story;
    NSString *messageFB;
    NSString *source;
    NSString *created_time;
    NSString *picture;
    NSString *full_picture;
}
@property (nonatomic ,retain) NSString *source;
@property (nonatomic ,retain) NSString *typeFB;
@property (nonatomic ,retain) NSString *story;
@property (nonatomic ,retain) NSString *messageFB;
@property (nonatomic ,retain) NSString *created_time;
@property (nonatomic ,retain) NSString *picture;
@property (nonatomic ,retain) NSString *full_picture;
//@property (nonatomic ,retain) NSString *updateDate;
//@property (nonatomic ,retain) NSString *textConten;
-(id)initWithJSON:(NSDictionary *)dic;
@end
