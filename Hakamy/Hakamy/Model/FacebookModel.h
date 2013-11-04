//
//  FacebookModel.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookModel : NSObject{
    NSString *updateDate;
    NSString *textConten;
}
@property (nonatomic ,retain) NSString *updateDate;
@property (nonatomic ,retain) NSString *textConten;
-(id)initWithJSON:(NSDictionary *)dic;
@end
