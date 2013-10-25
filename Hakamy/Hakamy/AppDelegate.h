//
//  AppDelegate.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, PaperFoldMenuControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MenuViewController *menuController;
@end
