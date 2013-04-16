#import <UIKit/UIKit.h>

@protocol AKAuthControl;

@interface ENTourViewController : UIViewController
@property(nonatomic, weak) id<AKAuthControl> authControl;
@end
