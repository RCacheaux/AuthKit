#import "MATourViewController.h"

#import <AuthKit/AKAuthControl.h>

@interface MATourViewController ()

@end

@implementation MATourViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [loginButton addTarget:self
                  action:@selector(logIn:)
        forControlEvents:UIControlEventTouchUpInside];
  [loginButton setTitle:@"Log In" forState:UIControlStateNormal];
  loginButton.frame = CGRectMake(20.0f, 20.0f, 90.0f, 48.0f);
  [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)logIn:(id)sender {
  [self.authControl beginAuthenticationAttempt];
}

@end
