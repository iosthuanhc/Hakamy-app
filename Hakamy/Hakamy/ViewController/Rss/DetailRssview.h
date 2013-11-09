//
//  DetailRssview.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDetail.h"
#import "DetailRssModel.h"
#import "RssModel.h"
@interface DetailRssview : UITableViewController{
    NSMutableArray *listDetailRss;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (strong, nonatomic) DetailRssModel *detailModel;
@property (nonatomic,retain) RssModel *rssModel;
@end
