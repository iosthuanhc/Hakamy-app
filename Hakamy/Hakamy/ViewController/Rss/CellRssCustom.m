//
//  CellRssCustom.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "CellRssCustom.h"

@implementation CellRssCustom
@synthesize thumbnail,lblDescription,lblTitle;
@synthesize rssModel,lblDatetime;
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
    
    lblTitle.text=rssModel.title;
    lblDescription.text=rssModel.news_summry;
    NSString *actDate = [NSString stringWithFormat:@"/Date(%@)/",rssModel.timee];
    NSString *nDate = [[[[actDate componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([nDate doubleValue] / 1000)];
    NSDateFormatter *dtfrm = [[NSDateFormatter alloc] init];
    [dtfrm setDateFormat:@"MM/dd/yyyy"];
    NSString *dateText= [dtfrm stringFromDate:date];
    lblDatetime.text=dateText;
    NSURL *url = [NSURL URLWithString:rssModel.news_thumb];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
            [thumbnail setImage:image];
            
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
