//
//  DetailInstagramController.h
//  Hakamy
//
//  Created by AnhKien on 11/20/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntagramModel.h"

@interface DetailInstagramController : UIViewController<UIActionSheetDelegate>
{
    
}
@property (strong,nonatomic) NSMutableArray *listIntag;
@property (strong,nonatomic) IBOutlet UILabel *lblDmm;
@property (strong,nonatomic) IBOutlet UILabel *lblNumber;

@property (strong,nonatomic) IBOutlet UIImageView *imageView;
-(IBAction)shareImage:(id)sender;
-(IBAction)backButton:(id)sender;

-(void) loadImageDetail:(NSInteger)index;
-(IBAction)next:(id)sender;
-(IBAction)previout:(id)sender;
- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnTwitter:(id)sender;
- (IBAction)btnInstagram:(id)sender;
- (IBAction)btnYoutube:(id)sender;

@end
