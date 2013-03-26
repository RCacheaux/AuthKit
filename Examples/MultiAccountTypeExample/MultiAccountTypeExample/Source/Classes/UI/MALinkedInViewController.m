#import "MALinkedInViewController.h"

#import <AuthKit/AKAccountStore.h>
#import <AuthKit/AKAuthControl.h>

#import "LinkedIn.h"

@interface MALinkedInViewController ()

@end

@implementation MALinkedInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadLogoutButton];
  [self loadUpdateProfileButton];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)loadLogoutButton {
  UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [logoutButton setTitle:@"Log Out" forState:UIControlStateNormal];
  [logoutButton addTarget:self
                   action:@selector(logout:)
         forControlEvents:UIControlEventTouchUpInside];
  logoutButton.frame = CGRectMake(20.0f, 200.0f, 100.0f, 60.0f);
  [self.view addSubview:logoutButton];
}

- (void)logout:(id)sender {
  [self.authControl
   unauthenticateAccount:[[AKAccountStore sharedStore] authenticatedMasterAccount]];
}

- (void)loadUpdateProfileButton {
  UIButton *updateProfileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [updateProfileButton setTitle:@"Load Profile" forState:UIControlStateNormal];
  [updateProfileButton addTarget:self
                          action:@selector(loadProfile:)
                forControlEvents:UIControlEventTouchUpInside];
  updateProfileButton.frame = CGRectMake(20.0f, 80.0f, 100.0f, 60.0f);
  [self.view addSubview:updateProfileButton];
}

- (void)loadProfile:(id)sender {
  [LinkedIn getPeopleCurrentWithCompletionHandler:^(NSDictionary *profile, NSError *error) {
    NSLog(@"Data: %@", profile);
  }];
}

@end
