//
//  InstagramViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramViewController : UIViewController{
    NSMutableArray *listMedia;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}

@end
