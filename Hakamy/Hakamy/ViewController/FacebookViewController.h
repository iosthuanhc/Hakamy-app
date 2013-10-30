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
@interface FacebookViewController : UIViewController{
    NSMutableArray *listSosial;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)btnMenu:(id)sender;
@end
