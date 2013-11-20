//
//  NewInstagramController.m
//  Hakamy
//
//  Created by AnhKien on 11/20/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "NewInstagramController.h"
#import "Cell.h"
#import "UIViewController+MJPopupViewController.h"
@interface NewInstagramController ()

@end

@implementation NewInstagramController
@synthesize table;
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
    
    [self getJSONValues];
}
-(void)viewDidAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];


}
#pragma mark JSON get
-(void)getJSONValues{
    [DejalBezelActivityView activityViewForView:self.view];
    responseData = [NSMutableData data];
    NSString*url=INSTAGRAM_API;
    NSString *strConvert= [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:strConvert]];
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	responseData = nil;
}

#pragma mark Process loan data
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    lisInstagram =[[NSMutableArray alloc]init];
    NSArray *results=[responseString JSONValue] ;
    for(NSDictionary *item in results)
    {
        IntagramModel *prf = [[IntagramModel alloc]initWithJSON:item];
        [lisInstagram addObject:prf];
    }
    [DejalBezelActivityView removeViewAnimated:YES];
    [table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
	return 109;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
	return 90;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
	return 3;
}

- (NSInteger) numberOfCellsOfGridView:(UIGridView *) grid
{
	return lisInstagram.count;
}

- (UIGridViewCell *) gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
	Cell *cell = (Cell *)[grid dequeueReusableCell];
	
	if (cell == nil) {
		cell = [[Cell alloc] init];
	}
	IntagramModel *model=[lisInstagram objectAtIndex:(rowIndex*2)+rowIndex+columnIndex];
    [cell loadImage:model];
	
	return cell;
}

- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)colIndex
{
	NSLog(@"%d, %d clicked", rowIndex, colIndex);
    DetailInstagramController *dic = [[DetailInstagramController alloc] initWithNibName:@"DetailInstagramController" bundle:nil];
    dic.listIntag = lisInstagram;
    IntagramModel *model=[lisInstagram objectAtIndex:(rowIndex*2)+rowIndex+colIndex];

    dic.lblDmm.text=model.full_name;

    [dic loadImageDetail:(rowIndex*2)+rowIndex+colIndex];
   
    
    [self.navigationController pushViewController:dic animated:YES];
    
}

-(void)backtoMainView{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}

NSInteger tapindex;
- (IBAction)btnMenu:(id)sender {
    if (tapindex == 0) {
        tapindex = 1;
        [((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController showMenu:YES animated:YES];
    }else
    {
        tapindex = 0;
        [((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController showMenu:NO animated:YES];
    }
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
