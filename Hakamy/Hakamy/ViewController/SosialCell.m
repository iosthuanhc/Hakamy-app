//
//  SosialCell.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "SosialCell.h"

@implementation SosialCell
@synthesize twitterModel,lblText,imageAvata,btnShare;
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
-(void)loadDataCell{
    lblText.text=twitterModel.title;
//    NSURL *url = [NSURL URLWithString:youtubeModel.imageurl];
//    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
//        if (succeeded) {
//            // change the image in the cell
//            [imageview setImage:image];
//            
//            // cache the image for use later (when scrolling up)
//            //venue.image = image;
//        }
//    }];
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
- (IBAction)btnShare:(id)sender {
}
@end
