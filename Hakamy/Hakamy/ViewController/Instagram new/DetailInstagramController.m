//
//  DetailInstagramController.m
//  Hakamy
//
//  Created by AnhKien on 11/20/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "DetailInstagramController.h"
@interface DetailInstagramController ()<UIViewControllerTransitioningDelegate>

@end

@implementation DetailInstagramController
@synthesize imageView,listIntag,lblDmm,lblNumber;
NSInteger indexNow;
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
-(void)viewDidAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [self loadImageDetail:indexNow];

   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadImageDetail:(NSInteger)index
{
    IntagramModel *im = [listIntag objectAtIndex:index];
    indexNow = index;
    lblNumber.text = [NSString stringWithFormat:@"%d/%d",index+1,listIntag.count];
    [self loadImage:im];
}
-(void)loadImage:(IntagramModel*)instagramModel{
    lblDmm.text=instagramModel.full_name;
    NSURL *url = [NSURL URLWithString:instagramModel.url];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            [imageView setImage:image];
        }
    }];
    
}
-(void)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
-(void)next:(id)sender
{
    indexNow++;
    if (indexNow < listIntag.count) {
        [self loadImageDetail:indexNow];
    }else
        indexNow = listIntag.count-1;
}
-(void)previout:(id)sender
{
    indexNow--;
    if (indexNow >= 0) {
        [self loadImageDetail:indexNow];
    }else
        indexNow = 0;

}
-(void)sangtrang:(id)sender
{
    DetailInstagramController *dic = [[DetailInstagramController alloc]initWithNibName:@"DetailInstagramController" bundle:nil];
    dic.listIntag=listIntag;
    [dic loadImageDetail:2];
    [self.navigationController pushViewController:dic animated:YES];
}
-(void)shareImage:(id)sender
{
    IntagramModel *model = [listIntag objectAtIndex:indexNow];

    if(NSClassFromString(@"SLComposeViewController") != nil) {
        NSString *text = [NSString stringWithFormat:PLAYMP3,model.full_name];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.url]]];
        NSArray *activityItems = [NSArray arrayWithObjects:text,image,TEXT_DEFAULT, nil];
        UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        activityController.excludedActivityTypes=@[UIActivityTypePostToWeibo];
        [self presentViewController:activityController animated:YES completion:NULL];
    }else{
        UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Chose Option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Mail",@"Facebook",@"Twiter", nil];
        [asheet showInView:self.view];
    }
    
//         [self shareClick:im];
}

- (IBAction)btnFacebook:(id)sender {
    [self callWebview:0];
}

- (IBAction)btnTwitter:(id)sender {
    [self callWebview:1];
}

- (IBAction)btnInstagram:(id)sender {
    [self callWebview:2];
}

- (IBAction)btnYoutube:(id)sender {
    [self callWebview:3];
}
-(void)callWebview:(NSInteger) btnIndex{
    WebviewFollow *detailVC=[[WebviewFollow alloc]initWithNibName:@"WebviewFollow" bundle:nil];
    switch (btnIndex) {
        case 0:
            detailVC.htmlLink=@"http://www.facebook.com/";
            break;
        case 1:
            detailVC.htmlLink=@"https://twitter.com/";
            break;
        case 2:
            detailVC.htmlLink=@"http://instagram.com/";
            break;
        case 3:
            detailVC.htmlLink=@"http://www.youtube.com/";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
