//
//  DetaiRss.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDetail.h"
#import "DetailRssModel.h"
#import "RssModel.h"
@interface DetaiRss : UIViewController<UIActionSheetDelegate>{
    NSMutableArray *listDetailRss;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (strong, nonatomic) IBOutlet UILabel *lblTime;
@property (strong, nonatomic) DetailRssModel *detailModel;
@property (nonatomic,retain) RssModel *rssModel;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIButton *backButtion;
@property (strong, nonatomic) IBOutlet UILabel *lbltitle;
@property (strong, nonatomic) IBOutlet UITextView *txtTextview;
@property (strong, nonatomic) IBOutlet UIImageView *imgFull;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;

- (IBAction)backButtion:(id)sender;
- (IBAction)btnShare:(id)sender;

- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnTwitter:(id)sender;
- (IBAction)btnInstagram:(id)sender;
- (IBAction)btnYoutube:(id)sender;
@end
