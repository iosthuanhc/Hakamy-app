//
//  MediaViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "MediaViewController.h"
#import "AudioPlayer.h"
@interface MediaViewController ()

@end
NSInteger btnIndex;
@implementation MediaViewController
@synthesize tableView=_tableView;
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
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [self getJSONValues];
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
#pragma mark JSON get
-(void)getJSONValues{
    [DejalBezelActivityView activityViewForView:self.view];
    responseData = [NSMutableData data];
    NSString*url=MEDIA_API;
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
    listMedia =[[NSMutableArray alloc]init];
    NSArray *results=[responseString JSONValue] ;
    for(NSDictionary *item in results)
    {
        MediaModel *prf = [[MediaModel alloc]initWithJSON:item];
        [listMedia addObject:prf];
    }
    [DejalBezelActivityView removeViewAnimated:YES];
    [self.tableView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listMedia.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CellMedia";
    CellMedia *cell = (CellMedia *) [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
//    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
//    cell = (CellMedia *)[nibArray objectAtIndex:0];
//    [cell configurePlayerButton];
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CellMedia" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[CellMedia class]]) {
                cell = (CellMedia *) currentObject;
                break;
            }
        }
    }
    MediaModel *model=[listMedia objectAtIndex:indexPath.row];
    cell.mediaModel=model;
    [cell loadDataCell];
    [cell configurePlayerButton];
    cell.delegate=self;
    cell.audioButton.tag = indexPath.row;
    [cell.audioButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)playAudio:(AudioButton *)button
{
    NSInteger index = button.tag;
    MediaModel *model=[listMedia objectAtIndex:index];
    
    if (_audioPlayer == nil) {
        _audioPlayer = [[AudioPlayer alloc] init];
    }
    
    if ([_audioPlayer.button isEqual:button]) {
        model.isplaying=NO;
        [_audioPlayer play];
    } else {
        [_audioPlayer stop];
        
        _audioPlayer.button = button;
        _audioPlayer.url = [NSURL URLWithString:[NSString stringWithFormat:PLAYMP3,model._id]];
        model.isplaying=YES;
        [_audioPlayer play];
    }
}
-(void)shareClick{
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        NSString *text = TEXT_DEFAULT;
        UIImage *image = [UIImage imageNamed:@""];
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.tableView = nil;
}
@end
