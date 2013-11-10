//
//  FacebookViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "FacebookViewController.h"

@interface FacebookViewController ()

@end
NSInteger btnIndex;
@implementation FacebookViewController
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
    [self getJSONValues];
}
#pragma mark JSON get
-(void)getJSONValues{
    [DejalBezelActivityView activityViewForView:self.view];
    responseData = [NSMutableData data];
    NSString*url=TWITTER_API;
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
    listWT =[[NSMutableArray alloc]init];
    NSArray *results=[responseString JSONValue] ;
    for(NSDictionary *item in results)
    {
        TwitterModel *prf = [[TwitterModel alloc]initWithJSON:item];
        [listWT addObject:prf];
    }
    [self getFacebookData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getFacebookData{
    listFB=[[NSMutableArray alloc]init];
    NSString *fbRespon=[NSString stringWithContentsOfURL:[NSURL URLWithString:A_API] encoding:NSUTF8StringEncoding error:Nil];
    NSDictionary *fbDic=[fbRespon JSONValue];
    //entries
    NSArray *results=[fbDic objectForKey:@"data"];
    for(NSDictionary *item in results)
    {
        FacebookModel *prf = [[FacebookModel alloc]initWithJSON:item];
        [listFB addObject:prf];
    }
    [self loadData];
}
-(void)loadData{
    listSosial=[[NSMutableArray alloc]init];
    for (int i=0; i<listWT.count; i++) {
        //Thu Oct 24 05:46:50 +0000 2013  TW
        SocialModel *socialModel=[[SocialModel alloc]init];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
        NSDate *date = [dateFormat dateFromString:[[listWT objectAtIndex:i] created_at]];
        socialModel.dateVL=date;
        socialModel.textConten=[[listWT objectAtIndex:i] textTitle];
        socialModel.isFacebook=NO;
        socialModel.socialType=@"status";
        [listSosial addObject:socialModel];
    }
    for (int i=0; i<listFB.count; i++) {
        //2013-11-02T08:33:18-07:00  FB
        SocialModel *socialModel=[[SocialModel alloc]init];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
        NSDate *date = [dateFormat dateFromString:[[listFB objectAtIndex:i] created_time]];
        socialModel.dateVL=date;
        socialModel.socialType=[[listFB objectAtIndex:i] typeFB];
        socialModel.story=[[listFB objectAtIndex:i] story];
        socialModel.picture=[[listFB objectAtIndex:i] picture];
        socialModel.source=[[listFB objectAtIndex:i] source];
        socialModel.messageFB=[[listFB objectAtIndex:i] messageFB];
        socialModel.isFacebook=YES;
        [listSosial addObject:socialModel];
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dateVL" ascending:NO];
    [listSosial sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [DejalBezelActivityView removeViewAnimated:YES];
    [tableview reloadData];
}
#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listSosial.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SosialCell";
    static NSString *CellIdentifier1 = @"CellImage";
    static NSString *CellIdentifier2 = @"CellVideo";
    
    SocialModel *model=[listSosial objectAtIndex:indexPath.row];
    if ([model.socialType isEqualToString:@"status"]) {
        SosialCell *cell = (SosialCell *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SosialCell" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[SosialCell class]]) {
                    cell = (SosialCell *) currentObject;
                    break;
                }
            }
        }
        
        cell.twitterModel=model;
        cell.socialModel=model;
        [cell loadDataCell];
        return cell;
    }
    if ([model.socialType isEqualToString:@"photo"]) {
        CellImage *cell = (CellImage *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CellImage" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[CellImage class]]) {
                    cell = (CellImage *) currentObject;
                    break;
                }
            }
        }
        
        cell.socialModel=model;
        [cell loadSocialCell];
        return cell;
    }
    if ([model.socialType isEqualToString:@"link"]) {
        SosialCell *cell = (SosialCell *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SosialCell" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[SosialCell class]]) {
                    cell = (SosialCell *) currentObject;
                    break;
                }
            }
        }
        return cell;
    }
    if ([model.socialType isEqualToString:@"video"]) {
        CellVideo *cell = (CellVideo *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier2];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CellVideo" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[CellVideo class]]) {
                    cell = (CellVideo *) currentObject;
                    break;
                }
            }
        }
        cell.socialModel=model;
        [cell loadSocialCell];
        return cell;
    }else{
        SosialCell *cell = (SosialCell *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SosialCell" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[SosialCell class]]) {
                    cell = (SosialCell *) currentObject;
                    break;
                }
            }
        }
        
        cell.twitterModel=model;
        [cell loadDataCell];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SocialModel *model=[listSosial objectAtIndex:indexPath.row];
    if ([model.socialType isEqualToString:@"status"]) {
        return 70.0f;
    }
    if ([model.socialType isEqualToString:@"photo"]) {
        return 200.0f;
    }
    if ([model.socialType isEqualToString:@"link"]) {
        return 70.0f;
    }
    if ([model.socialType isEqualToString:@"video"]) {
        return 200.0f;
    }else {
        return 70.0f;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
