#import "MALinkedInAuthController.h"

#import <AuthKit/AKAuthHandler.h>
#import <AuthKit/AKAccountStore.h>
#import <AuthKit/AKAccount.h>
#import <gtm-oauth2/GTMOAuth2ViewControllerTouch.h>
#import <gtm-oauth2/GTMOAuth2Authentication.h>
#import <gtm-oauth2/GTMOAuth2SignIn.h>

#import "AKGTMOAuth2Account.h"

typedef  void (^GTMOAuth2CompletionHandler)(GTMOAuth2ViewControllerTouch *viewController,
                                            GTMOAuth2Authentication *auth,
                                            NSError *error);

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
      AKGTMOAuth2Account *masterAccount =
          (AKGTMOAuth2Account *)[[AKAccountStore sharedStore]
                                 newAccountOfType:[AKGTMOAuth2Account class]];
      [[AKAccountStore sharedStore] saveMasterAccount:masterAccount];
      [weakSelf.authHandler authControllerAccount:masterAccount didAuthenticate:weakSelf];
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

- (void)unauthenticateAccount:(AKAccount *)account {
  [[AKAccountStore sharedStore] authenticatedMasterAccount].credentials = nil;
  [self.authHandler authControllerAccount:account didUnauthenticate:self];
}

@end
