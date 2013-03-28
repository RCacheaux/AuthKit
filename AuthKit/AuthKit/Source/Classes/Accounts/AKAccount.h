#import <Foundation/Foundation.h>

@class AKAccountType;

@interface AKAccount : NSObject

// TODO(rcacheaux): Make most of these properties read only.
@property(nonatomic, copy, readonly) NSString *identifier;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *accountType;
@property(nonatomic, strong) NSMutableDictionary *userInfo;
@property(nonatomic, strong) id credentials;

@end
