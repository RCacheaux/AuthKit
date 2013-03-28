#import "AKGTMOAuth2Account.h"

#import <gtm-oauth2/GTMOAuth2Authentication.h>
#import <gtm-oauth2/GTMOAuth2ViewControllerTouch.h>

#import "AKOAuth2AccountCredential.h"

@implementation AKGTMOAuth2Account

- (AKOAuth2AccountCredential *)OAuth2Credential {
  
  NSURL *tokenURL =
      [NSURL URLWithString:@"https://www.linkedin.com/uas/oauth2/accessToken"];
  GTMOAuth2Authentication *auth =
      [GTMOAuth2Authentication authenticationWithServiceProvider:@"LinkedIn"
                                                        tokenURL:tokenURL
                                                     redirectURI:@"http://www.apple.com/blah"
                                                        clientID:@"5se92tdnfz61"
                                                    clientSecret:@"GneNrlqv99QIZTTq"];
  if (!auth) {
    return nil;
  }
  auth.scope = @"r_fullprofile";
  
  
  BOOL isAuthenticated =
      [GTMOAuth2ViewControllerTouch authorizeFromKeychainForName:@"AuthKit: Linked In"
                                                  authentication:auth];
  if (!isAuthenticated) {
    return nil;
  }
  
  // TODO(rcacheaux): Need adapter.
  AKOAuth2AccountCredential *credential = [[AKOAuth2AccountCredential alloc] init];
  credential.accessToken = auth.accessToken;
  
  return credential;
}

@end
