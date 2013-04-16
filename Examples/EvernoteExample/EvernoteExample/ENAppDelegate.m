//
//  ENAppDelegate.m
//  EvernoteExample
//
//  Created by Josh Berlin on 4/14/13.
//  Copyright (c) 2013 rcach. All rights reserved.
//

#import "ENAppDelegate.h"

#import "ENApplicationViewController.h"
#import "ENAuthController.h"

#import "ENConstants.h"
#import "EvernoteSession.h"

@implementation ENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self setupEvernoteSession];
  
  ENAuthController *authController = [ENAuthController sharedController];
  ENApplicationViewController *viewController =
      [ENApplicationViewController
       masterAccountViewControllerWithAuthController:authController];
  authController.authHandler = viewController;
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = viewController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)setupEvernoteSession {
  static NSString * const CONSUMER_KEY = @"joshb21";
  static NSString * const CONSUMER_SECRET = @"6c576c1388deb783";
  NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox;
  [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                            consumerKey:CONSUMER_KEY
                         consumerSecret:CONSUMER_SECRET];
}

@end