#import "ENTourViewController.h"

#import <AuthKit/AKAuthControl.h>

@implementation ENTourViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [loginButton addTarget:self
                  action:@selector(logIn:)
        forControlEvents:UIControlEventTouchUpInside];
  [loginButton setTitle:@"Log In To Evernote" forState:UIControlStateNormal];
  loginButton.frame = CGRectMake(20.0f, 60.0f, 280.0f, 48.0f);
  [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)logIn:(id)sender {
  [self.authControl authenticate];
}

@end
