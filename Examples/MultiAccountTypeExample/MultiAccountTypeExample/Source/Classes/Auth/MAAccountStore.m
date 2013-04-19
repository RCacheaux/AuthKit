#import "MAAccountStore.h"

#import "AKGTMOAuth2Account.h"

@implementation MAAccountStore

- (Class)accountTypeClass {
  return [AKGTMOAuth2Account class];
}

@end
