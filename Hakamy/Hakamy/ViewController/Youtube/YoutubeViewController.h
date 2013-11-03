//
//  YoutubeViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeModel.h"
#import "YoutubeCell.h"
#import "Detailyoutube.h"
@interface YoutubeViewController : UIViewController<DetailYoutubeDelegate,YoutubeDelegate,UIActionSheetDelegate>{
    
    NSMutableArray *lisYoutube;
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
