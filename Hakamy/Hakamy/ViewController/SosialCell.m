//
//  SosialCell.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/30/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "SosialCell.h"

@implementation SosialCell
@synthesize twitterModel,lblText,imageAvata,btnShare,lblNumberComment;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization codeself.bodyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.lblText setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.lblText setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.lblText setLineBreakMode:NSLineBreakByTruncatingTail];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadDataCell{
    lblText.text=twitterModel.textConten;
    if (twitterModel.isFacebook) {
        imageAvata.image=[UIImage imageNamed:@"thumbnail1.png"];
    }else{
        imageAvata.image=[UIImage imageNamed:@"thumbnail_twitter.png"];
    }
//    lblText.text=[NSString stringWithFormat:@"%@",twitterModel.dateVL];
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
- (void)updateConstraints {
    [super updateConstraints];
    
    if (self.didSetupConstraints) return;
    
//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeLeading
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeLeading
//                                     multiplier:1.0f
//                                     constant:kLabelHorizontalInsets]];
//    
//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeTop
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeTop
//                                     multiplier:1.0f
//                                     constant:(kLabelHorizontalInsets / 2)]];
//    
//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeTrailing
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeTrailing
//                                     multiplier:1.0f
//                                     constant:-kLabelHorizontalInsets]];
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [self.contentView  addConstraint:[NSLayoutConstraint
                                      constraintWithItem:self.lblText
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0f
                                      constant:kLabelHorizontalInsets]];
    
//    [self.contentView  addConstraint:[NSLayoutConstraint
//                                      constraintWithItem:self.lblText
//                                      attribute:NSLayoutAttributeTop
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.titleLabel
//                                      attribute:NSLayoutAttributeBottom
//                                      multiplier:1.0f
//                                      constant:(kLabelHorizontalInsets / 4)]];
    
    [self.contentView  addConstraint:[NSLayoutConstraint
                                      constraintWithItem:self.lblText
                                      attribute:NSLayoutAttributeTrailing
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeTrailing
                                      multiplier:1.0f
                                      constant:-kLabelHorizontalInsets]];
    
    [self.contentView  addConstraint:[NSLayoutConstraint
                                      constraintWithItem:self.lblText
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0f
                                      constant:-(kLabelHorizontalInsets / 2)]];
    
    self.didSetupConstraints = YES;
}

@end
