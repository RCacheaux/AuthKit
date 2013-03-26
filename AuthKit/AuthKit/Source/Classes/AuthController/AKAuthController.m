#import "AKAuthController.h"

@implementation AKAuthController

+ (instancetype)sharedController {
  static AKAuthController *_sharedController = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedController = [[self alloc] init];
  });
  return _sharedController;
}

@end
