#import <Foundation/Foundation.h>

@class AKAccount;

// TODO(rcacheaux): Docs.
@protocol AKAuthControl

// TODO(rcacheaux): Add method for handling cancel login.

// TODO: Rename.
- (void)authenticate;
- (void)unauthenticateAccount:(AKAccount *)account;

@end
