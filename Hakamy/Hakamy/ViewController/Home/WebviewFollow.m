//
//  WebviewFollow.m
//  ScribeX
//
//  Created by Hà Công Thuận on 13/05/2013.
//  Copyright (c) 2013 Se7en. All rights reserved.
//

#import "WebviewFollow.h"
#import "DejalActivityView.h"
@interface WebviewFollow ()

@end

@implementation WebviewFollow
@synthesize webview,htmlLink;

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
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    webview.opaque=NO;
    webview.delegate=self;
    [self loadHTMLLink];
}
-(void)loadHTMLLink{
    NSURL *url = [NSURL URLWithString:htmlLink];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestObj];
}
- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -WebView delegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [DejalBezelActivityView activityViewForView:self.view];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [DejalBezelActivityView removeViewAnimated:YES];
}
- (void)viewDidUnload {
    [self setWebview:nil];
    [super viewDidUnload];
}
@end
