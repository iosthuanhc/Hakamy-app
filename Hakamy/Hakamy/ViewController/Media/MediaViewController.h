//
//  MediaViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaModel.h"
#import "CellMedia.h"
@class AudioPlayer;
@interface MediaViewController : UIViewController<CellMediaDelegate,UIActionSheetDelegate>{
    NSMutableArray *listMedia;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
    AudioPlayer *_audioPlayer;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnMenu:(id)sender;
@end
