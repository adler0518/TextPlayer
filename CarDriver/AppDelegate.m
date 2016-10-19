//
//  AppDelegate.m
//  CarDriver
//
//  Created by qitmac000260 on 16/10/8.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import "AppDelegate.h"
#import "VCController.h"
#import "AppInfo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    [self.window setBackgroundColor:[UIColor yellowColor]];
    
    [self.window makeKeyAndVisible];
    
    
    
//    UIViewController *rvc = [[UIViewController alloc] init];
//    [[rvc view] setFrame:CGRectMake(0, 0, [AppInfo appFrame].size.width, [AppInfo appFrame].size.height)];
//    [[rvc view] setBackgroundColor:[UIColor redColor]];
//    [window addSubview:rvc.view];
//    [window setRootViewController:rvc];

//    [VCController mainVCC];
//    return YES;

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id vc = [storyboard instantiateViewControllerWithIdentifier: @"TabBarCon"];
    [VCController pushVC:vc WithAnimation:nil];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
