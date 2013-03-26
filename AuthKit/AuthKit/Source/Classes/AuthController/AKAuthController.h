#import <Foundation/Foundation.h>

#import "AKAuthControl.h"

@protocol AKAuthHandler;

@interface AKAuthController : NSObject<AKAuthControl>

@property(nonatomic, weak) id<AKAuthHandler> authHandler;

+ (instancetype)sharedController;

@end
