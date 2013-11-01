//
//  SosialCell.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterModel.h"
@interface SosialCell : UITableViewCell
@property (strong, nonatomic) TwitterModel *twitterModel;
@property (strong, nonatomic) IBOutlet UIImageView *imageAvata;
@property (strong, nonatomic) IBOutlet UILabel *lblText;
@property (strong, nonatomic) IBOutlet UILabel *lblNumberComment;

@property (strong, nonatomic) IBOutlet UIButton *btnShare;
- (IBAction)btnShare:(id)sender;
-(void)loadDataCell;
@end
