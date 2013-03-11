#import "AKLoginViewController.h"

@interface AKLoginViewController ()

@end

@implementation AKLoginViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor redColor];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
	UILabel *screenIDLabel =
      [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 100.0f, 20.0f)];
  screenIDLabel.text = @"LOGIN";
  screenIDLabel.backgroundColor = [UIColor clearColor];
  [self.view addSubview:screenIDLabel];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
