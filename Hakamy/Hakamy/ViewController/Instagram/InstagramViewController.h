//
//  InstagramViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntagramModel.h"
#import "InstagramCell.h"
@interface InstagramViewController : UIViewController{
    NSMutableArray *lisInstagram;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnMenu:(id)sender;
@end
