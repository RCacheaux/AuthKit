#import <UIKit/UIKit.h>

@protocol AKAuthControl;

@interface ENViewController : UIViewController

@property(nonatomic, weak) id<AKAuthControl> authControl;

@end
