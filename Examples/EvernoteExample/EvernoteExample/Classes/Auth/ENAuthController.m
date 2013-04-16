#import "ENAuthController.h"

#import <AuthKit/AKAuthHandler.h>
#import <AuthKit/AKAccountStore.h>
#import <AuthKit/AKAccount.h>

#import "EvernoteSession.h"

@implementation ENAuthController

- (void)authenticate {
  ENAuthController __weak *weakSelf = self;
  
  EvernoteSession *session = [EvernoteSession sharedSession];
  UIViewController *presentingViewController = [self.authHandler authPresentingViewController];
  [session authenticateWithViewController:presentingViewController
                        completionHandler:^(NSError *error) {
    if (error || !session.isAuthenticated) {
      NSLog(@"Error %@", error);
    } else {
      [weakSelf.authHandler authControllerAccount:nil didAuthenticate:weakSelf];
    }
  }];
}

- (void)unauthenticateAccount:(AKAccount *)account {
  EvernoteSession *session = [EvernoteSession sharedSession];
  [session logout];
  [self.authHandler authControllerAccount:nil didUnauthenticate:self];
}

@end
