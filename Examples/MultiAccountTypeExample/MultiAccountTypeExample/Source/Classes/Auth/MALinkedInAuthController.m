#import "MALinkedInAuthController.h"

@implementation MALinkedInAuthController

- (NSString *)clientID {
  return @"5se92tdnfz61";
}

- (NSString *)accessTokenURLString {
  return @"https://www.linkedin.com/uas/oauth2/accessToken";
}

- (NSString *)serviceName {
  return @"LinkedIn";
}

- (NSString *)redirectURIString {
  return @"http://www.apple.com/blah";
}

- (NSString *)clientSecret {
  return @"GneNrlqv99QIZTTq";
}

- (NSString *)keychainItemName {
  return @"AuthKit: Linked In";
}

- (NSString *)scope {
  return @"r_fullprofile";
}

- (NSString *)authCodeURLString {
  return @"https://www.linkedin.com/uas/oauth2/authorization";
}

@end
