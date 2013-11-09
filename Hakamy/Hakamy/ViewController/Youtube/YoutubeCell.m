//
//  YoutubeCell.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "YoutubeCell.h"

@implementation YoutubeCell
@synthesize imageview,lblTitle,share,youtubeModel;
@synthesize delegate;
@synthesize webview;
@synthesize socialModel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)share:(id)sender {
    [delegate shareClick:youtubeModel];
}
-(void)loadSocialCell{
    
}
-(void)loadDataCell{
    lblTitle.text=youtubeModel.title;
    [self configureView];
    NSURL *url = [NSURL URLWithString:youtubeModel.imageurl];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
            [imageview setImage:image];
            
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
- (void)configureView
{
    [self displayGoogleVideo:youtubeModel.src frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
}
- (void) displayGoogleVideo:(NSString *)urlString frame:(CGRect)frame
{
    NSString *htmlString = [NSString stringWithFormat:@"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 212\"/></head><body style=\"margin-top:0px;margin-left:0px\"><div><param name=\"movie\" value=\"%@\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"%@\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"%0.0f\" height=\"%0.0f\"></embed></object></div></body></html>",urlString,urlString,frame.size.width,frame.size.height];
    
    [webview loadHTMLString:htmlString baseURL:nil];
    NSLog(@"HTML IS: %@", htmlString);
    
}
@end
