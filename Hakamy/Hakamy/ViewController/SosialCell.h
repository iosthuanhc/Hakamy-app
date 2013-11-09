//
//  SosialCell.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//
#define kLabelHorizontalInsets 20.0f
#import <UIKit/UIKit.h>
#import "TwitterModel.h"
#import "SocialModel.h"
@interface SosialCell : UITableViewCell
@property (strong, nonatomic) SocialModel *twitterModel;

@property (strong, nonatomic) IBOutlet UIImageView *imageAvata;

@property (strong, nonatomic) IBOutlet UILabel *lblText;
@property (strong, nonatomic) IBOutlet UILabel *lblNumberComment;

@property (nonatomic, assign) BOOL didSetupConstraints;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;
@property (nonatomic,retain) SocialModel *socialModel;
-(void)loadSocialCell;
- (IBAction)btnShare:(id)sender;
-(void)loadDataCell;
@end
