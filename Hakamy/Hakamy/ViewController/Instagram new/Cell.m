//
//  Cell.m
//  naivegrid
//
//  Created by Apirom Na Nakorn on 3/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"
#import <QuartzCore/QuartzCore.h> 

@implementation Cell


@synthesize thumbnail;


- (id)init {
	
    if (self = [super init]) {
		
        self.frame = CGRectMake(0, 0, 80, 80);
		
		[[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
		
        [self addSubview:self.view];
		
		self.thumbnail.layer.cornerRadius = 4.0;
		self.thumbnail.layer.masksToBounds = YES;
		self.thumbnail.layer.borderColor = [UIColor lightGrayColor].CGColor;
		self.thumbnail.layer.borderWidth = 1.0;
	}
	
    return self;
	
}
-(void)loadImage:(IntagramModel*)instagramModel{
    NSURL *url = [NSURL URLWithString:instagramModel.url];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            [thumbnail setImage:image];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/




@end
