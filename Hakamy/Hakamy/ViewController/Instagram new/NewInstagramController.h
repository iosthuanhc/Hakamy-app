//
//  NewInstagramController.h
//  Hakamy
//
//  Created by AnhKien on 11/20/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
#import "UIGridViewDelegate.h"
#import "IntagramModel.h"
#import "DetailInstagramController.h"

@interface NewInstagramController : UIViewController<UIGridViewDelegate>
{
    NSMutableArray *lisInstagram;
    NSMutableData* responseData;
    NSURLRequest *request;
    NSURLConnection *connection;
}
@property (nonatomic, retain) IBOutlet UIGridView *table;
- (IBAction)btnMenu:(id)sender;
- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnTwitter:(id)sender;
- (IBAction)btnInstagram:(id)sender;
- (IBAction)btnYoutube:(id)sender;
@end
