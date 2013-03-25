#import <Foundation/Foundation.h>

@class AKAccount;
@class UIViewController;

@protocol AKAuthControl;

// TODO(rcacheaux): Docs.
@protocol AKAuthHandler

// TODO(rcacheaux): Rename to avoid naming collision.
- (void)presentViewController:(UIViewController *)viewController;
- (void)authControllerAccount:(AKAccount *)account
              didAuthenticate:(id<AKAuthControl>)authController;
- (void)authControllerAccount:(AKAccount *)account
            didUnauthenticate:(id<AKAuthControl>)authController;

@end
