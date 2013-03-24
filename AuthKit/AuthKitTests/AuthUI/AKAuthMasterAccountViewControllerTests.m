#import <SenTestingKit/SenTestingKit.h>

#import <OCMock/OCMock.h>

#import "AKAuthController.h"
#import "AKAuthMasterAccountViewController.h"

@interface AKAuthMasterAccountViewControllerTests : SenTestCase

@end

@implementation AKAuthMasterAccountViewControllerTests

- (void)testControllerCreation {
  AKAuthMasterAccountViewController *masterAccountViewController =
      [[AKAuthMasterAccountViewController alloc] init];
  STAssertNotNil(masterAccountViewController, nil);
}

- (void)testAuthenticate {
  id masterAccountAuthController =
      [OCMockObject mockForProtocol:@protocol(AKAuthControl)];
  [[masterAccountAuthController expect] authenticate];
  
  AKAuthMasterAccountViewController *masterAccountViewController =
      [AKAuthMasterAccountViewController
       masterAccountViewControllerWithAuthController:masterAccountAuthController];

  [masterAccountViewController authenticate];
  [masterAccountAuthController verify];
}


@end
