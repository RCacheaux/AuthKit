//
//  ENAppDelegate.h
//  EvernoteExample
//
//  Created by Josh Berlin on 4/14/13.
//  Copyright (c) 2013 rcach. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ENViewController;

@interface ENAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ENViewController *viewController;

@end
