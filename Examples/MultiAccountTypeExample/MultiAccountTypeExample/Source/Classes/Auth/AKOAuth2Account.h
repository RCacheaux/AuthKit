#import "AKAccount.h"

@class AKOAuth2AccountCredential;

@interface AKOAuth2Account : AKAccount

@property(nonatomic, strong, readonly) AKOAuth2AccountCredential *OAuth2Credential;

@end
