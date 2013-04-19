#import "AKAuthMasterAccountViewController.h"

#import "AKAuthControl.h"

@interface AKAuthMasterAccountViewController ()
@property(nonatomic, strong, readwrite) id<AKAuthControl> masterAccountAuthController;
@end

@implementation AKAuthMasterAccountViewController

+ (instancetype)
    masterAccountViewControllerWithAuthController:(id<AKAuthControl>)authController {
  return [[self alloc] initWithNibName:nil bundle:nil authController:authController];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                 authController:(id<AKAuthControl>)authController {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    _masterAccountAuthController = authController;
  }
  return self;
}

// TODO(rcacheaux): Invalidate default initializer.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    //
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark AKAuthHandler

- (void)presentAKLoginViewController:(UIViewController *)viewController {
  // TODO(rcacheaux): Implement
}

- (void)authControllerAccount:(AKAccount *)account
              didAuthenticate:(id<AKAuthControl>)authController {
  // TODO(rcacheaux): Implement.
}

- (void)authControllerAccount:(AKAccount *)account
            didUnauthenticate:(id<AKAuthControl>)authController {
  // TODO(rcacheaux): Implement.
}

- (UIViewController *)authPresentingViewController {
  // TODO(rcacheaux): Implement.
  return nil;
}

#pragma mark AKAuthenticatableViewController

- (void)authenticate {
  [self.masterAccountAuthController beginAuthenticationAttempt];
}

- (void)unauthenticate {
//  [self.masterAccountAuthController unauthenticate];
}

@end
