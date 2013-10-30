//
//  CellMedia.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/28/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "CellMedia.h"

@implementation CellMedia
@synthesize mediaModel;
@synthesize lblTitle,lblDescription,thumbnail;
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
-(void)loadDataCell{
    lblTitle.text=mediaModel.title;
    lblDescription.text=mediaModel.genre;
}
- (IBAction)btnPlay:(id)sender {
    [delegate playMediaclick:mediaModel._id];
    
}
@end
