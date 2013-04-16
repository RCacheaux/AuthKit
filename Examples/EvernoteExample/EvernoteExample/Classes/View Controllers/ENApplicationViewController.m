#import "ENApplicationViewController.h"

#import <AuthKit/AKAuthControl.h>

#import "ENAuthController.h"
#import "ENTourViewController.h"
#import "ENViewController.h"

@interface ENApplicationViewController ()<AKAuthControl>
@property(nonatomic, strong) ENTourViewController *tourViewController;
@property(nonatomic, strong) UIViewController *loginViewController;
@property(nonatomic, strong) ENViewController *evernoteViewController;
@end

@implementation ENApplicationViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadTourViewController];
}

- (void)viewWillLayoutSubviews {
  self.tourViewController.view.frame = self.view.bounds;
}

- (void)loadTourViewController {
  self.tourViewController = [[ENTourViewController alloc] init];
  self.tourViewController.authControl = self;
  [self addChildViewController:self.tourViewController];
  [self.view addSubview:self.tourViewController.view];
}

#pragma mark AKAuthControl

- (void)authenticate {
  [self.masterAccountAuthController authenticate];
}

- (void)unauthenticateAccount:(AKAccount *)account {
  [self.masterAccountAuthController unauthenticateAccount:account];
}

#pragma mark AKAuthHandler

- (void)presentViewController:(UIViewController *)viewController {
  // Evernote expects a view controller when starting a session, so this code is never called.
  self.loginViewController = viewController;
  [self addChildViewController:viewController];
  [self.view addSubview:viewController.view];
}

- (void)authControllerAccount:(AKAccount *)account
              didAuthenticate:(id<AKAuthControl>)authController {
  // TODO: Check if exists.
  [self.loginViewController.view removeFromSuperview];
  [self.loginViewController removeFromParentViewController];
  
  [self.tourViewController.view removeFromSuperview];
  [self.tourViewController removeFromParentViewController];
  
  self.evernoteViewController = [[ENViewController alloc] init];
  self.evernoteViewController.authControl = self;
  self.evernoteViewController.view.frame = self.view.bounds;
  [self addChildViewController:self.evernoteViewController];
  [self.view addSubview:self.evernoteViewController.view];
}

- (void)authControllerAccount:(AKAccount *)account
            didUnauthenticate:(id<AKAuthControl>)authController {
  [self.evernoteViewController.view removeFromSuperview];
  [self.evernoteViewController removeFromParentViewController];
  
  [self addChildViewController:self.tourViewController];
  [self.view addSubview:self.tourViewController.view];
}

- (UIViewController *)authPresentingViewController {
  return self;
}

@end
