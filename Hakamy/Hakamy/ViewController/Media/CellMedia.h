//
//  CellMedia.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaModel.h"
@protocol CustomCellMediaDelegate;
@interface CellMedia : UITableViewCell{
    MediaModel *mediaModel;
}
@property (nonatomic,assign) id <CustomCellMediaDelegate> delegate;
@property (nonatomic,retain) MediaModel *mediaModel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

-(void)loadDataCell;
@property (strong, nonatomic) IBOutlet UIButton *btnPlay;
- (IBAction)btnPlay:(id)sender;
@end
@protocol CustomCellMediaDelegate <NSObject>
@optional
- (void)playMediaclick:(NSString*)trackID;
@end
