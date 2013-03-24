#import <Foundation/Foundation.h>

@class AKAccount;

// TODO(rcacheaux): Docs.
@protocol AKAuthControl

- (void)authenticate;
- (void)unauthenticate;

@end
