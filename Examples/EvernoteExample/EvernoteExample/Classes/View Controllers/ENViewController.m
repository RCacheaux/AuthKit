#import "ENViewController.h"

#import <AuthKit/AKAccountStore.h>
#import <AuthKit/AKAuthControl.h>

#import "EvernoteNoteStore.h"

@implementation ENViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadLogoutButton];
  [self loadListNotebooksButton];
}

- (void)loadLogoutButton {
  UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [logoutButton setTitle:@"Log Out" forState:UIControlStateNormal];
  [logoutButton addTarget:self
                   action:@selector(logout:)
         forControlEvents:UIControlEventTouchUpInside];
  logoutButton.frame = CGRectMake(20.0f, 200.0f, 280.0f, 60.0f);
  [self.view addSubview:logoutButton];
}

- (void)loadListNotebooksButton {
  UIButton *listNotebooksButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [listNotebooksButton setTitle:@"Fetch Notes" forState:UIControlStateNormal];
  [listNotebooksButton addTarget:self
                          action:@selector(listNotebooks:)
                forControlEvents:UIControlEventTouchUpInside];
  listNotebooksButton.frame = CGRectMake(20.0f, 80.0f, 280.0f, 60.0f);
  [self.view addSubview:listNotebooksButton];
}

- (void)logout:(id)sender {
  [self.authControl unauthenticateAccount:[[AKAccountStore sharedStore] authenticatedMasterAccount]];
}

- (void)listNotebooks:(id)sender {
  EvernoteNoteStore *noteStore = [EvernoteNoteStore noteStore];
  [noteStore listNotebooksWithSuccess:^(NSArray *notebooks) {
      NSLog(@"notebooks: %@", notebooks);
  }
                              failure:^(NSError *error) {
      if([EvernoteSession isTokenExpiredWithError:error]) {
        // TODO: re-authenticate
        // [self.authControl authenticate];
      }
      NSLog(@"error %@", error);
  }];
}

@end
