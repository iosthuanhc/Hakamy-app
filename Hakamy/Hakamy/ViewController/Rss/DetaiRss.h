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
@interface DetaiRss : UIViewController{
    NSMutableArray *listDetailRss;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (strong, nonatomic) DetailRssModel *detailModel;
@property (nonatomic,retain) RssModel *rssModel;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIButton *backButtion;
- (IBAction)backButtion:(id)sender;
@end
