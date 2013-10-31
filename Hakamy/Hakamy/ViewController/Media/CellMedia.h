//
//  CellMedia.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaModel.h"
#import "AudioButton.h"

@protocol CustomCellMediaDelegate;
@interface CellMedia : UITableViewCell{
    MediaModel *mediaModel;
}
@property (nonatomic,retain) MediaModel *mediaModel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet AudioButton *audioButton;
- (void)configurePlayerButton;

-(void)loadDataCell;
@end

