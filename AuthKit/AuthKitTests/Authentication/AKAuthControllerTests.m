#import <SenTestingKit/SenTestingKit.h>

#import "AKFakeAuthController.h"

@interface AKAuthControllerTests : SenTestCase

@end

@implementation AKAuthControllerTests

- (void)testAuthControllerCreation {
  AKFakeAuthController *authController = [[AKFakeAuthController alloc] init];
  STAssertNotNil(authController, nil);
}

@end
