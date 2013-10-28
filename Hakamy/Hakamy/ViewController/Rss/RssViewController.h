//
//  RssViewController.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellRssCustom.h"
@interface RssViewController : UIViewController{
    NSMutableArray *lisRss;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end
