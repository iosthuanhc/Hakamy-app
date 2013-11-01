//
//  InstagramCell.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "InstagramCell.h"

@implementation InstagramCell
@synthesize imageview,lblTitle,share,instagramModel;
@synthesize delegate;
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
    [delegate shareClick];
}
-(void)loadDataCell{
    lblTitle.text=instagramModel.full_name;
    NSURL *url = [NSURL URLWithString:instagramModel.url];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
            [imageview setImage:image];
            
            // cache the image for use later (when scrolling up)
            //venue.image = image;
            }
        }];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//    dispatch_async(queue, ^(void) {
//        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:instagramModel.url]];
//        UIImage* image = [[UIImage alloc] initWithData:imageData];
//        if (image) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                imageview.image = image;
//            });
//        }
//    });

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
