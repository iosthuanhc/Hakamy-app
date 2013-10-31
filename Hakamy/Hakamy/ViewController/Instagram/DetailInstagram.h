//
//  DetailInstagram.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/31/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntagramModel.h"
@protocol DetailInstagramDelegate;
@interface DetailInstagram : UIViewController{
    UIImage *dtImage;
}
@property (nonatomic,retain) IntagramModel *instagramModel;
@property (nonatomic, assign) id <DetailInstagramDelegate> delegate;
@property (strong, nonatomic) UIImage *dtImage;
@property (strong, nonatomic) IBOutlet UIImageView *detailImageview;
- (IBAction)viewClick:(id)sender;
@end
@protocol DetailInstagramDelegate <NSObject>

@optional
-(void)backtoMainView;
@end