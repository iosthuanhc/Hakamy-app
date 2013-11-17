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

@protocol CellMediaDelegate;
@interface CellMedia : UITableViewCell{
    MediaModel *mediaModel;
}
@property (nonatomic ,assign) id<CellMediaDelegate> delegate;
@property (nonatomic,retain) MediaModel *mediaModel;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet AudioButton *btnPlay;
@property (strong, nonatomic) IBOutlet AudioButton *audioButton;
- (void)configurePlayerButton;
-(void)loadDataCell;
-(void) showPlay;
-(void)showStop;
- (IBAction)btnPlay:(id)sender;

- (IBAction)btnShare:(id)sender;
@end

@protocol CellMediaDelegate <NSObject>
@optional
-(void)shareClick:(MediaModel *)mediaModel;
-(void)playButtonClick:(AudioButton *)button;
-(void)stopButtonClick:(AudioButton *)button;
@end
