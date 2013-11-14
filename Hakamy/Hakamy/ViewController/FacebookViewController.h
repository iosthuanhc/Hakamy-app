//
//  FacebookViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterModel.h"
#import "SosialCell.h"
#import "FacebookModel.h"
#import "SocialModel.h"
#import "InstagramCell.h"
#import "YoutubeCell.h"
#import "CellImage.h"
#import "CellVideo.h"

@interface FacebookViewController : UIViewController{
    NSMutableArray *listSosial;
    NSMutableArray *listFB;
    NSMutableArray *listWT;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
    NSString *previous;
    NSString *next;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnMenu:(id)sender;
- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnTwitter:(id)sender;
- (IBAction)btnInstagram:(id)sender;
- (IBAction)btnYoutube:(id)sender;
@end
