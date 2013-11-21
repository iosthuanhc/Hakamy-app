//
//  YoutubeViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "YoutubeViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import <MediaPlayer/MediaPlayer.h>
//#import "LBYouTubePlayerViewController.h"
@interface YoutubeViewController ()

@end
NSInteger btnIndex;
@implementation YoutubeViewController{
    MPMoviePlayerViewController *moviePlayer;
}
@synthesize tableview;
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
    
    [self getJSONValues];
    // Do any additional setup after loading the view from its nib.
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
-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}
#pragma mark JSON get
-(void)getJSONValues{
    [DejalBezelActivityView activityViewForView:self.view];
    responseData = [NSMutableData data];
    NSString*url=YOUTOBE_API;
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
    lisYoutube =[[NSMutableArray alloc]init];
    NSDictionary *result=[responseString JSONValue] ;
    NSDictionary *feedjson=[result objectForKey:@"feed"] ;
    NSArray *results=[feedjson objectForKey:@"entry"] ;
    for(NSDictionary *item in results)
    {
        YoutubeModel *prf = [[YoutubeModel alloc]initWithJSON:item];
        [lisYoutube addObject:prf];
    }
    [DejalBezelActivityView removeViewAnimated:YES];
    [tableview reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YoutubeModel *model=[lisYoutube objectAtIndex:indexPath.row];
    if (model.title.length > 39) {
        NSInteger abc = model.title.length/39;
        return 250+(5*abc);
    }else
    {
        return 250;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lisYoutube.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"YoutubeCell";
    if(lisYoutube.count == 0){
        UITableViewCell *cell = (UITableViewCell*)[tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.textLabel.text = @"You don't have any new messages!";
        cell.backgroundColor = [UIColor darkGrayColor];
        return  cell;
    }
    else {
        YoutubeCell *cell = (YoutubeCell *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"YoutubeCell" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[YoutubeCell class]]) {
                    cell = (YoutubeCell *) currentObject;
                    break;
                }
            }
        }
        YoutubeModel *model=[lisYoutube objectAtIndex:indexPath.row];
        cell.youtubeModel=model;

        if (model.title.length > 39) {
                NSInteger abc = model.title.length/39;
                [cell addCellAutoSize:32+(5+abc) size:(abc+5)];
            }else
                [cell addCellNormal];
        
        cell.delegate=self;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Detailyoutube *secondDetailViewController = [[Detailyoutube alloc] initWithNibName:@"Detailyoutube" bundle:nil];
//    YoutubeModel *model=[lisYoutube objectAtIndex:indexPath.row];
//    secondDetailViewController.youtubeModel=model;
//    secondDetailViewController.delegate=self;
//    secondDetailViewController.view.layer.cornerRadius=8;
//    [self presentPopupViewController:secondDetailViewController animationType:MJPopupViewAnimationSlideBottomBottom];
//    lbYoutubePlayerVC = [[LBYouTubePlayerViewController alloc]initWithYouTubeURL:[NSURL URLWithString:URLString] quality:LBYouTubeVideoQualityLarge];
//    lbYoutubePlayerVC.delegate=self;
    
}
#pragma mark - Notifications

- (void) videoPlayerViewControllerDidReceiveMetadata:(NSNotification *)notification
{
	NSURL *thumbnailURL = notification.userInfo[XCDMetadataKeyMediumThumbnailURL] ?: notification.userInfo[XCDMetadataKeySmallThumbnailURL];
	[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:thumbnailURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
	}];
    [self dismissMoviePlayerViewControllerAnimated];
}
// this is for play
- (void)playYoutube:(id)sender
{
    NSString *youtubeID=(NSString *)sender;
    self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:youtubeID];
//    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
//    [defaultCenter addObserver:self selector:@selector(videoPlayerViewControllerDidReceiveMetadata:) name:XCDYouTubeVideoPlayerViewControllerDidReceiveMetadataNotification object:self.videoPlayerViewController];
    
//    [defaultCenter addObserver:self selector:@selector(moviePlayerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.videoPlayerViewController.moviePlayer];
    
//    [defaultCenter removeObserver:self.videoPlayerViewController  name:XCDYouTubeVideoPlayerViewControllerDidReceiveMetadataNotification object:self.videoPlayerViewController.moviePlayer];
    
    [self presentModalViewController:self.videoPlayerViewController animated:YES];
	[self.videoPlayerViewController.moviePlayer play];
}
- (void) moviePlayerPlaybackDidFinish:(NSNotification *)notification
{
	NSError *error = notification.userInfo[XCDMoviePlayerPlaybackDidFinishErrorUserInfoKey];
	if (error)
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
		[alertView show];
	}
}
-(void)backtoMainView{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}
-(void)shareClick:(YoutubeModel *)model{
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        NSString *text = [NSString stringWithFormat:@"%@ %@",model.title,model.src];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.imageurl]]];
        NSArray *activityItems = [NSArray arrayWithObjects:text,image,TEXT_DEFAULT, nil];
        UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        activityController.excludedActivityTypes=@[UIActivityTypePostToWeibo];
        [self presentViewController:activityController animated:YES completion:NULL];
    }else{
        UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Chose Option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Mail",@"Facebook",@"Twiter", nil];
        [asheet showInView:self.view];
    }
}
- (IBAction)btnFacebook:(id)sender {
    btnIndex=0;
    [self callWebview];
}

- (IBAction)btnTwitter:(id)sender {
    btnIndex=1;
    [self callWebview];
}

- (IBAction)btnInstagram:(id)sender {
    btnIndex=2;
    [self callWebview];
}

- (IBAction)btnYoutube:(id)sender {
    btnIndex=3;
    [self callWebview];
}
-(void)callWebview{
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
