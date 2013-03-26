#import <UIKit/UIKit.h>

@protocol AKAuthControl;

@interface MALinkedInViewController : UIViewController

@property(nonatomic, weak) id<AKAuthControl> authControl;

@end
