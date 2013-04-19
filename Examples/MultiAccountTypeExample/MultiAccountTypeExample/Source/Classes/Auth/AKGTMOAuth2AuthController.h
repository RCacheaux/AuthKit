#import "AKAuthController.h"

@class GTMOAuth2Authentication;

@interface AKGTMOAuth2AuthController : AKAuthController

@property(nonatomic, copy) NSString *clientID;
@property(nonatomic, copy) NSString *clientSecret;

@property(nonatomic, copy) NSString *authCodeURLString;
@property(nonatomic, copy) NSString *accessTokenURLString;

@property(nonatomic, copy) NSString *scope;
@property(nonatomic, copy) NSString *redirectURIString;

@property(nonatomic, copy) NSString *serviceName;
@property(nonatomic, copy) NSString *keychainItemName;

- (GTMOAuth2Authentication *)newGTMOAuth2Authentication;

@end
