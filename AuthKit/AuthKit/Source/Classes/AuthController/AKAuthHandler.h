#import <Foundation/Foundation.h>

@class AKAccount;
@class UIViewController;

@protocol AKAuthControl;


@protocol AKAuthHandler

- (void)presentAKLoginViewController:(UIViewController *)viewController;
- (void)authControllerAccount:(AKAccount *)account
              didAuthenticate:(id<AKAuthControl>)authController;
- (void)authControllerAccount:(AKAccount *)account
            didUnauthenticate:(id<AKAuthControl>)authController;

@end



// TODO(rcacheaux): Docs.
// TODO(rcacheaux): Rename to avoid naming collision.