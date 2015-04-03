//
//  AppDelegate.m
//  Hypnosister
//
//  Created by N3962 on 2015. 4. 2..
//  Copyright (c) 2015년 BigNerdRanch. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    CGRect firstFrame = self.window.bounds;
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
    firstView.backgroundColor = [UIColor whiteColor];
    
    [self.window addSubview:firstView];
    
    // 두번째 View
    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
    BNRHypnosisView *secondView = [[BNRHypnosisView alloc] initWithFrame:secondFrame];
    secondView.backgroundColor = [UIColor blueColor];
    
    //[self.window addSubview:secondView];
    //[firstView addSubview:secondView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
