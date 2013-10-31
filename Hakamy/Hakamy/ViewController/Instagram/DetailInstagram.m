//
//  DetailInstagram.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/31/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "DetailInstagram.h"

@interface DetailInstagram ()

@end

@implementation DetailInstagram
@synthesize dtImage,detailImageview;
@synthesize delegate;
@synthesize instagramModel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self loadImage];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewClick:(id)sender {
    [delegate backtoMainView];
}
-(void)loadImage{
    NSURL *url = [NSURL URLWithString:instagramModel.url];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
            float width;
            float height;
            if ((image.size.width/image.size.height) > (self.view.frame.size.width/self.view.frame.size.height)) {
                width = self.view.frame.size.width;
                height = ((image.size.height*width)/image.size.width);
            }
            else{
                height = self.view.frame.size.height;
                width = ((image.size.width*height)/image.size.height);
            }
            
            [detailImageview setFrame:CGRectMake((self.view.frame.size.width - width)/2, (self.view.frame.size.height - height)/2, width, height)];
            [detailImageview setImage:image];
            // cache the image for use later (when scrolling up)
            //venue.image = image;
        }
    }];
    
}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
@end
