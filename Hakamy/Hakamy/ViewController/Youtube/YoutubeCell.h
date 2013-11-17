//
//  YoutubeCell.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "YoutubeModel.h"
@protocol YoutubeDelegate;
@interface YoutubeCell : UITableViewCell
@property (nonatomic ,assign) id<YoutubeDelegate> delegate;
@property (nonatomic,retain) YoutubeModel *youtubeModel;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UIButton *share;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UIButton *btn_playYoutube;
@property (nonatomic,retain) SocialModel *socialModel;
-(void)loadSocialCell;
- (IBAction)share:(id)sender;
-(void)loadDataCell;
- (void)configureView;
- (IBAction)btn_playYoutube:(id)sender;
@end
@protocol YoutubeDelegate <NSObject>
@optional
-(void)shareClick:(YoutubeModel *)model;
@end