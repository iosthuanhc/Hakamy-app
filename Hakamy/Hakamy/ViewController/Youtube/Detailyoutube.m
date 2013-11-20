//
//  Detailyoutube.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/31/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "Detailyoutube.h"
#import <MediaPlayer/MediaPlayer.h>
@interface Detailyoutube ()
- (void)configureView;
@end

@implementation Detailyoutube
@synthesize youtubeModel,delegate;
@synthesize webView;
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
    
//    [self configureView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewClick:(id)sender {
    [delegate backtoMainView];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Managing the detail item
- (void) displayGoogleVideo:(NSString *)urlString frame:(CGRect)frame
{
    NSString *htmlString = [NSString stringWithFormat:@"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 212\"/></head><body style=\"margin-top:0px;margin-left:0px\"><div><param name=\"movie\" value=\"%@\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"%@\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"%0.0f\" height=\"%0.0f\"></embed></object></div></body></html>",urlString,urlString,frame.size.width,frame.size.height];
    
    [webView loadHTMLString:htmlString baseURL:nil];
    NSLog(@"HTML IS: %@", htmlString);
    
}
/*
 - (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
 NSString *embedHTML = @"\
 <html><head>\
 <style type=\"text/css\">\
 body {\
 background-color: transparent;\
 color: transparent;\
 }\
 </style>\
 </head><body style=\"margin:0\">\
 <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
 width=\"%0.0f\" height=\"%0.0f\"></embed>\
 </body></html>";
 NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
 NSLog(@"HTML IS: %@", html);
 [webView loadHTMLString:html baseURL:nil];
 
 
 }
 */


- (void)configureView
{
    [self displayGoogleVideo:youtubeModel.src frame:CGRectMake(30, 0, self.view.frame.size.width, self.view.frame.size.height-100)];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
@end
