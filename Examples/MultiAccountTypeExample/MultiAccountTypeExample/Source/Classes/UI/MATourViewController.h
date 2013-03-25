#import <UIKit/UIKit.h>

@protocol AKAuthControl;

@interface MATourViewController : UIViewController
@property(nonatomic, weak) id<AKAuthControl> authControl;
@end
