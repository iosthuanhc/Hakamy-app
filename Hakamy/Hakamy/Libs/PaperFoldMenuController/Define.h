//
//  Define.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#ifndef Hakamy_Define_h
#define Hakamy_Define_h

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//Api

#define INSTAGRAM_API           @"http://appzy.info/7akamy/index.php?task=instagram"
#define MEDIA_API               @"http://appzy.info/7akamy/index.php?task=soundcloud"
#define TRACK_API               @"http://appzy.info/7akamy/index.php?task=play&trackid=%@"
#define A_API                   @"http://appzy.info/7akamy/index.php?task=facebook"
#define TWITTER_API             @"http://appzy.info/7akamy/index.php?task=twitter"
#define YOUTOBE_API             @"http://appzy.info/7akamy/index.php?task=youtube"
#define FACEBOOK_API            @"https://www.facebook.com/feeds/page.php?format=json&id=381541015300212"


#endif
