//
//  MenuViewController.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    UIButton *takePhoto = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 90, 50)];
    [takePhoto setImage:[UIImage imageNamed:@"btn_menu.png"] forState:UIControlStateNormal];
    [takePhoto addTarget:self action:@selector(toggleLeftPanel:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *takePhotoBar = [[UIBarButtonItem alloc] initWithCustomView:takePhoto];
    [self.navigationItem setRightBarButtonItem:takePhotoBar];
    // Do any additional setup after loading the view from its nib.
}
- (void)toggleLeftPanel:(__unused id)sender {
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
