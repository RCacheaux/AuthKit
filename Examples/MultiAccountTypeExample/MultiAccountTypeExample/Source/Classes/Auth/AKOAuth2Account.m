#import "AKOAuth2Account.h"

#import "AKOAuth2AccountCredential.h"

@implementation AKOAuth2Account

- (AKOAuth2AccountCredential *)OAuth2Credential {
  // Subclasses should implement this. They should always access credentials from a secure
  // store.
  return nil;
}

@end
