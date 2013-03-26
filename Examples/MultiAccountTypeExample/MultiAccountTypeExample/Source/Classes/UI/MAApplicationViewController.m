#import "MAApplicationViewController.h"

#import <AuthKit/AKAuthControl.h>

#import "MATourViewController.h"
#import "MALinkedInViewController.h"

@interface MAApplicationViewController ()<AKAuthControl>
@property(nonatomic, strong) MATourViewController *tourViewController;
@property(nonatomic, strong) UIViewController *loginViewController;
@property(nonatomic, strong) MALinkedInViewController *linkedInViewController;
@end

@implementation MAApplicationViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self loadTourViewController];
}

- (void)viewWillLayoutSubviews {
  self.tourViewController.view.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)loadTourViewController {
  self.tourViewController = [[MATourViewController alloc] init];
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
  
  self.linkedInViewController = [[MALinkedInViewController alloc] init];
  self.linkedInViewController.authControl = self;
  self.linkedInViewController.view.frame = self.view.bounds;
  [self addChildViewController:self.linkedInViewController];
  [self.view addSubview:self.linkedInViewController.view];
}

- (void)authControllerAccount:(AKAccount *)account
            didUnauthenticate:(id<AKAuthControl>)authController {
  [self.linkedInViewController.view removeFromSuperview];
  [self.linkedInViewController removeFromParentViewController];
  
  [self addChildViewController:self.tourViewController];
  [self.view addSubview:self.tourViewController.view];
}

@end
