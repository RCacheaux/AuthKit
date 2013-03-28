#import "AKAccount.h"

@interface AKOAuth2AccountCredential : AKAccount

// TODO: Add any other OAuth2 properties like refresh token.
@property(nonatomic, copy) NSString *accessToken;

@end
