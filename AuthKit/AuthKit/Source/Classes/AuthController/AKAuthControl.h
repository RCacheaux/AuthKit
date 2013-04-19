#import <Foundation/Foundation.h>

@class AKAccount;

@protocol AKAuthControl

- (void)beginAuthenticationAttempt;
- (void)unauthenticateAccount:(AKAccount *)account;

@end

// TODO(rcacheaux): Docs.
// TODO(rcacheaux): Add method for handling cancel login.