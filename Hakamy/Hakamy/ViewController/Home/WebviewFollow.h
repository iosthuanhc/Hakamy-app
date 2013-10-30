//
//  WebviewFollow.h
//  ScribeX
//
//  Created by Hà Công Thuận on 13/05/2013.
//  Copyright (c) 2013 Se7en. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebviewFollow : UIViewController<UIWebViewDelegate>{
    NSString *htmlLink;
}
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic,retain) NSString *htmlLink;
- (IBAction)btnBack:(id)sender;
@end
