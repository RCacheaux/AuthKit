#import <Foundation/Foundation.h>

@class AKAccount;

// TODO(rcacheaux): Docs.
@protocol AKAuthControl

// TODO: Rename.
- (void)authenticate;
- (void)unauthenticateAccount:(AKAccount *)account;

@end
