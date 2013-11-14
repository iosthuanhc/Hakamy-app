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
@synthesize lblTitle,lblDescription,thumbnail,audioButton = _audioButton;
@synthesize btnShare;
@synthesize delegate;
@synthesize btnPlay;
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

- (IBAction)btnShare:(id)sender {
    [delegate shareClick:mediaModel];
}
- (void)configurePlayerButton
{
//    NSString *playImage = @"play.png";
//    NSString *stopImage = @"stop.png";
//    if (mediaModel.isplaying) {
//        self.audioButton.image=[UIImage imageNamed:stopImage];
//    }else{
//        self.audioButton.image=[UIImage imageNamed:playImage];
//    }
    if(self.audioButton == nil){
    self.audioButton = [[AudioButton alloc] initWithFrame:CGRectMake(275, 2, 40, 40)];
    [self.contentView addSubview:self.audioButton];
    }
}
-(void) showPlay
{
    btnPlay.selected=YES;
}
-(void)showStop{
    btnPlay.selected=NO;
}
- (IBAction)btnPlay:(id)sender {
    if (btnPlay.isSelected) {
        btnPlay.selected=NO;
    }else{
        btnPlay.selected=YES;
    }
    [delegate playButtonClick:btnPlay];
}
@end
