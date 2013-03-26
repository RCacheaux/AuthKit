#import "MAApplicationViewController.h"

#import <AuthKit/AKAuthControl.h>

#import "MATourViewController.h"

#import "MALinkedInAuthController.h"
#import "LinkedIn.h"

@interface MAApplicationViewController ()<AKAuthControl>
@property(nonatomic, strong) MATourViewController *tourViewController;
@property(nonatomic, strong) UIViewController *loginViewController;
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

#pragma mark AKAuthHandler

- (void)presentViewController:(UIViewController *)viewController {
  self.loginViewController = viewController;
  [self addChildViewController:viewController];
  [self.view addSubview:viewController.view];
}

- (void)authControllerAccount:(AKAccount *)account
              didAuthenticate:(id<AKAuthControl>)authController {
  // TODO: Check if exists.
  [self.loginViewController removeFromParentViewController];
  [self.loginViewController.view removeFromSuperview];
  self.tourViewController.view.backgroundColor = [UIColor greenColor];
  
  MALinkedInAuthController *linkedInAuthController =
      (MALinkedInAuthController *)self.masterAccountAuthController;
  
  
  [LinkedIn getPeopleCurrentWithCompletionHandler:^(NSDictionary *profile, NSError *error) {
    NSLog(@"Data: %@", profile);
  } token:linkedInAuthController.OAuth2AccessToken];
  
}

@end
