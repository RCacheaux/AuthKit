@interface AKOAuth2AccountCredential : NSObject

@property(nonatomic, copy) NSString *accessToken;
@property(nonatomic, assign) NSDate *expirationDate;

@end


// TODO: Add any other OAuth2 properties like refresh token.