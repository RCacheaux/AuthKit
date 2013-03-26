#import "MALinkedInAuthController.h"

#import <AuthKit/AKAuthHandler.h>
#import <gtm-oauth2/GTMOAuth2ViewControllerTouch.h>
#import <gtm-oauth2/GTMOAuth2Authentication.h>
#import <gtm-oauth2/GTMOAuth2SignIn.h>

typedef  void (^GTMOAuth2CompletionHandler)(GTMOAuth2ViewControllerTouch *viewController,
                                            GTMOAuth2Authentication *auth,
                                            NSError *error);

static NSString * const kGoogleKeychainItemName = @"AuthKit Example: Google";
static NSString * const kGoogleClientID =
    @"581129179651-vdisshpchki6tnmhhte6k6lh7jj74icj.apps.googleusercontent.com";
static NSString * const kGoogleClientSecret = @"MaOWg_eoxSbkx3S5Zt7EM5RA";
static NSString * const kGoogleScope = @"https://www.googleapis.com/auth/plus.me";


/*
 
 // Request properties
 @property (copy) NSString *clientID;
 @property (copy) NSString *clientSecret;
 @property (copy) NSString *redirectURI;
 @property (retain) NSString *scope;
 @property (retain) NSString *tokenType;
 @property (retain) NSString *assertion;
 @property (retain) NSString *refreshScope;
 
 // Apps may optionally add parameters here to be provided to the token
 // endpoint on token requests and refreshes.
 @property (retain) NSDictionary *additionalTokenRequestParameters;
 
 // Apps may optionally add parameters here to be provided to the token
 // endpoint on specific token requests and refreshes, keyed by the grant_type.
 // For example, if a different "type" parameter is required for obtaining
 // the auth code and on refresh, this might be:
 //
 //  viewController.authentication.additionalGrantTypeRequestParameters = @{
 //    @"authorization_code" : @{ @"type" : @"code" },
 //    @"refresh_token" : @{ @"type" : @"refresh" }
 //  };
 @property (retain) NSDictionary *additionalGrantTypeRequestParameters;
 
 
 */


@implementation MALinkedInAuthController

- (void)authenticate {
  MALinkedInAuthController __weak *weakSelf = self;
  
  GTMOAuth2CompletionHandler completionHandler =
      ^(GTMOAuth2ViewControllerTouch *viewController,
        GTMOAuth2Authentication *auth,
        NSError *error)
  {
    if (!error) {
      // TODO(rcacheaux): Save authenticated account.
      weakSelf.OAuth2AccessToken = auth.accessToken;
      [weakSelf.authHandler authControllerAccount:nil didAuthenticate:weakSelf];
    } else {
      // TODO(rcacheaux): Log error.
    }
  };
  
  NSURL *tokenURL =
      [NSURL URLWithString:@"https://www.linkedin.com/uas/oauth2/accessToken"];
  GTMOAuth2Authentication *auth =
      [GTMOAuth2Authentication authenticationWithServiceProvider:@"LinkedIn"
                                                        tokenURL:tokenURL
                                                     redirectURI:@"http://www.apple.com/blah"
                                                        clientID:@"5se92tdnfz61"
                                                    clientSecret:@"GneNrlqv99QIZTTq"];
  auth.scope = @"r_fullprofile";
  
  NSURL *authURL =
      [NSURL URLWithString:@"https://www.linkedin.com/uas/oauth2/authorization"];
  GTMOAuth2ViewControllerTouch *googleOAuth2WebViewController =
      [GTMOAuth2ViewControllerTouch controllerWithAuthentication:auth
                                                authorizationURL:authURL
                                                keychainItemName:@"AuthKit: Linked In"
                                               completionHandler:completionHandler];
  
  googleOAuth2WebViewController.signIn.additionalAuthorizationParameters =
      @{ @"state" : @"98797542" };
  if (self.authHandler) {
    [self.authHandler presentViewController:googleOAuth2WebViewController];
  }
}

@end
