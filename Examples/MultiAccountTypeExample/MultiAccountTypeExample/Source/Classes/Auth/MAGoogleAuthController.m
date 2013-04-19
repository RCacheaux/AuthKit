#import "MAGoogleAuthController.h"

#import <AuthKit/AKAuthHandler.h>
#import <gtm-oauth2/GTMOAuth2ViewControllerTouch.h>
#import <gtm-oauth2/GTMOAuth2SignIn.h>

typedef  void (^GTMOAuth2CompletionHandler)(GTMOAuth2ViewControllerTouch *viewController,
                                            GTMOAuth2Authentication *auth,
                                            NSError *error);

static NSString * const kGoogleKeychainItemName = @"AuthKit Example: Google";
static NSString * const kGoogleClientID =
    @"581129179651-vdisshpchki6tnmhhte6k6lh7jj74icj.apps.googleusercontent.com";
static NSString * const kGoogleClientSecret = @"MaOWg_eoxSbkx3S5Zt7EM5RA";
static NSString * const kGoogleScope = @"https://www.googleapis.com/auth/plus.me";

@implementation MAGoogleAuthController
@end
