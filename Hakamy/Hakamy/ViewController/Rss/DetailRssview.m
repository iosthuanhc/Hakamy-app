//
//  DetailRssview.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "DetailRssview.h"
static NSString *CellIdentifier = @"CellIdentifier";

@interface DetailRssview ()
@end

@implementation DetailRssview
@synthesize rssModel;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imgView.image=[UIImage imageNamed:@"bg_others.png"];
//        [self.view addSubview:imgView];
        [self.tableView setBackgroundView:imgView];
        self.tableView.frame=CGRectMake(0, 65, 320, 430);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self getJSONValues];
    [self.tableView registerClass:[CellDetail class] forCellReuseIdentifier:CellIdentifier];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contentSizeCategoryChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}
#pragma mark JSON get
-(void)getJSONValues{
    [DejalBezelActivityView activityViewForView:self.view];
    responseData = [NSMutableData data];
    NSString*url=[NSString stringWithFormat:DETAIL_RSS_API,rssModel._id];
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
    listDetailRss =[[NSMutableArray alloc]init];
    NSArray *results=[responseString JSONValue] ;
    for(NSDictionary *item in results)
    {
         _detailModel = [[DetailRssModel alloc]initWithJSON:item];
        [listDetailRss addObject:_detailModel];
    }
    [DejalBezelActivityView removeViewAnimated:YES];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)contentSizeCategoryChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return listDetailRss.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CellDetail *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    [cell updateFonts];
    
    _detailModel = [listDetailRss objectAtIndex:indexPath.row];
    cell.titleLabel.text = _detailModel.title;
    cell.bodyLabel.text = _detailModel.news_full;
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CellDetail *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor clearColor];
    [cell updateFonts];
    _detailModel = [listDetailRss objectAtIndex:indexPath.row];
    cell.titleLabel.text = _detailModel.title;
    cell.bodyLabel.text = _detailModel.news_full;
    cell.bodyLabel.preferredMaxLayoutWidth = tableView.bounds.size.width - (kLabelHorizontalInsets * 2.0f);
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    [cell.contentView setNeedsLayout];
    [cell.contentView layoutIfNeeded];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500.0f;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
