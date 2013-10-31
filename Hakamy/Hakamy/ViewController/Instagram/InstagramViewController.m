//
//  InstagramViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "InstagramViewController.h"
#import "UIViewController+MJPopupViewController.h"
@interface InstagramViewController ()

@end

@implementation InstagramViewController
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lisInstagram.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"InstagramCell";
    if(lisInstagram.count == 0){
        UITableViewCell *cell = (UITableViewCell*)[tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.textLabel.text = @"You don't have any new messages!";
        cell.backgroundColor = [UIColor darkGrayColor];
        return  cell;
    }
    else {
        InstagramCell *cell = (InstagramCell *) [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"InstagramCell" owner:self options:nil];
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[InstagramCell class]]) {
                    cell = (InstagramCell *) currentObject;
                    break;
                }
            }
        }
        IntagramModel *model=[lisInstagram objectAtIndex:indexPath.row];
        cell.instagramModel=model;
        [cell loadDataCell];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailInstagram *secondDetailViewController = [[DetailInstagram alloc] initWithNibName:@"DetailInstagram" bundle:nil];
    IntagramModel *model=[lisInstagram objectAtIndex:indexPath.row];
    secondDetailViewController.instagramModel=model;
    secondDetailViewController.delegate=self;
    secondDetailViewController.view.layer.cornerRadius=8;
    [self presentPopupViewController:secondDetailViewController animationType:MJPopupViewAnimationSlideBottomBottom];
}
-(void)backtoMainView{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}
@end
