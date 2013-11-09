//
//  RssViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellRssCustom.h"
#import "RssModel.h"
#import "DetailRssview.h"
#import "DetaiRss.h"
@interface RssViewController : UIViewController{
    NSMutableArray *lisRss;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnMenu:(id)sender;
- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnTwitter:(id)sender;
- (IBAction)btnInstagram:(id)sender;
- (IBAction)btnYoutube:(id)sender;
@end
