//
//  Cell2.h
//  MultiCellTest
//
//  Created by Ha Cong Thuan on 11/10/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialModel.h"
@interface CellVideo : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imagethub;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (nonatomic,retain) SocialModel *socialModel;

@property (strong, nonatomic) IBOutlet UIWebView *webview;
-(void)loadSocialCell;
@end
