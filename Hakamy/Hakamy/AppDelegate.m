//
//  AppDelegate.m
//  Hakamy
//
//  Created by Ha Cong Thuan on 10/24/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "RssViewController.h"
#import "MediaViewController.h"
#import "InstagramViewController.h"
#import "YoutubeViewController.h"
#import "FacebookViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _menuController = [[MenuViewController alloc] initWithMenuWidth:210.0 numberOfFolds:3];
    [_menuController setDelegate:self];
    [self.window setRootViewController:_menuController];
    NSMutableArray *viewControllers = [[NSMutableArray alloc]init];
    //-------
    HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [homeVC setTitle:@""];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [viewControllers addObject:homeNav];
    //------
    RssViewController *rssVC = [[RssViewController alloc] initWithNibName:@"RssViewController" bundle:nil];
    [rssVC setTitle:@"Rss ViewController"];
    UINavigationController *rssNav = [[UINavigationController alloc] initWithRootViewController:rssVC];
    [viewControllers addObject:rssNav];
    //------
    MediaViewController *mediaVC = [[MediaViewController alloc] initWithNibName:@"MediaViewController" bundle:nil];
    [mediaVC setTitle:@"Media ViewController"];
    UINavigationController *mediaNav = [[UINavigationController alloc] initWithRootViewController:mediaVC];
    [viewControllers addObject:mediaNav];
    //------
    InstagramViewController *instagramVC = [[InstagramViewController alloc] initWithNibName:@"InstagramViewController" bundle:nil];
    [instagramVC setTitle:@"Instagram ViewController"];
    UINavigationController *instagramNav = [[UINavigationController alloc] initWithRootViewController:instagramVC];
    [viewControllers addObject:instagramNav];
    //-------
    YoutubeViewController *youtubeVC = [[YoutubeViewController alloc] initWithNibName:@"YoutubeViewController" bundle:nil];
    [youtubeVC setTitle:@"Youtube ViewController"];
    UINavigationController *youtubeNav = [[UINavigationController alloc] initWithRootViewController:youtubeVC];
    [viewControllers addObject:youtubeNav];
    //---------------
    FacebookViewController *fbVC = [[FacebookViewController alloc] initWithNibName:@"FacebookViewController" bundle:nil];
    [fbVC setTitle:@"Facebook ViewController"];
    UINavigationController *fbNav = [[UINavigationController alloc] initWithRootViewController:fbVC];
    [viewControllers addObject:fbNav];
    
    [_menuController setViewControllers:viewControllers];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];;
    return YES;
}
- (void)customizedApperance
{
    //Customize the look of the UINavBar for iOS 7 devices
    if ([[UINavigationBar class]respondsToSelector:@selector(appearance)]) {
//        UIImage *navImage;
        if (SYSTEM_VERSION_LESS_THAN(@"7.0")){
            [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
//            navImage = [UIImage imageNamed:@"bg_title_bar.png"];
//            [[UINavigationBar appearance] setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        }
        else {
            [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
//            navImage = [UIImage imageNamed:@"bg_title_bar_ios7.png"];
//            [[UINavigationBar appearance] setBackgroundImage:navImage forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
        }
    }
}
- (void)paperFoldMenuController:(PaperFoldMenuController *)paperFoldMenuController didSelectViewController:(UIViewController *)viewController
{
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
