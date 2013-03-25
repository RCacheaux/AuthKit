#import <UIKit/UIKit.h>

#import "AKAuthControl.h"
#import "AKAuthHandler.h"

@protocol AKAuthControl;

@interface AKAuthMasterAccountViewController :
    UIViewController<AKAuthHandler, AKAuthControl>

@property(nonatomic, strong, readonly) id<AKAuthControl> masterAccountAuthController;

+ (instancetype)
    masterAccountViewControllerWithAuthController:(id<AKAuthControl>)authController;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                 authController:(id<AKAuthControl>)authController;

@end
