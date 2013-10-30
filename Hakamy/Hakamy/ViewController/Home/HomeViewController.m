//
//  HomeViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

NSInteger tap;
-(void)setMenuButton{
    //Set Back button
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:[UIImage imageNamed:@"btn_menu.png"] forState:UIControlStateNormal];
    //[backButton setTitle:@"Refresh" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setShowsTouchWhenHighlighted:TRUE];
    [backButton addTarget:self action:@selector(showmenu) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *barBackItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barBackItem;
    
}
-(void) showmenu
{
    if (tap == 1) {
        tap = 2;
        [((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController showMenu:YES animated:YES];
    }else
    {
        tap = 1;
        [((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController showMenu:NO animated:YES];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self setMenuButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
