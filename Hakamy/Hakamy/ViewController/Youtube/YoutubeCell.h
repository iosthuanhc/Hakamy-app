//
//  YoutubeCell.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeModel.h"
@interface YoutubeCell : UITableViewCell
@property (nonatomic,retain) YoutubeModel *youtubeModel;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UIButton *share;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

- (IBAction)share:(id)sender;
-(void)loadDataCell;
@end
