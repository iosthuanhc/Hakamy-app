//
//  Detailyoutube.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/31/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeModel.h"
@protocol DetailYoutubeDelegate;

@interface Detailyoutube : UIViewController{
    IBOutlet UIWebView *webView;
}@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic,retain) YoutubeModel *youtubeModel;
@property (nonatomic, assign) id <DetailYoutubeDelegate> delegate;
- (IBAction)viewClick:(id)sender;
@end
@protocol DetailYoutubeDelegate <NSObject>

@optional
-(void)backtoMainView;
@end

