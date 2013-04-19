#import "AKGTMOAuth2AuthController.h"

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

@implementation AKGTMOAuth2AuthController

- (void)beginAuthenticationAttempt {
  AKGTMOAuth2AuthController __weak *weakSelf = self;
  
  GTMOAuth2CompletionHandler completionHandler =
      ^(GTMOAuth2ViewControllerTouch *viewController,
        GTMOAuth2Authentication *auth,
        NSError *error)
  {
    if (!error) {
      AKGTMOAuth2Account *account =
          (AKGTMOAuth2Account *)[[AKAccountStore sharedStore] newAccount];
      [[AKAccountStore sharedStore] saveAccount:account];
      [weakSelf.authHandler authControllerAccount:account didAuthenticate:weakSelf];
    } else {
      // Log error.
    }
  };
  
  GTMOAuth2Authentication *auth = [self newGTMOAuth2Authentication];
  NSURL *authURL =
      [NSURL URLWithString:self.authCodeURLString];
  GTMOAuth2ViewControllerTouch *googleOAuth2WebViewController =
      [GTMOAuth2ViewControllerTouch controllerWithAuthentication:auth
                                                authorizationURL:authURL
                                                keychainItemName:self.keychainItemName
                                               completionHandler:completionHandler];
  
  googleOAuth2WebViewController.signIn.additionalAuthorizationParameters =
      @{ @"state" : @"98797542" };
  if (self.authHandler) {
    [self.authHandler presentAKLoginViewController:googleOAuth2WebViewController];
  }
}

- (void)unauthenticateAccount:(AKAccount *)account {
  [[[AKAccountStore sharedStore] authenticatedAccount] clearCredential];
  [self.authHandler authControllerAccount:account didUnauthenticate:self];
}

- (GTMOAuth2Authentication *)newGTMOAuth2Authentication; {
  NSURL *tokenURL =
      [NSURL URLWithString:self.accessTokenURLString];
  GTMOAuth2Authentication *auth =
      [GTMOAuth2Authentication authenticationWithServiceProvider:self.serviceName
                                                        tokenURL:tokenURL
                                                     redirectURI:self.redirectURIString
                                                        clientID:self.clientID
                                                    clientSecret:self.clientSecret];
  auth.scope = self.scope;
  return auth;
}

@end
