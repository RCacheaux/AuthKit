#import <Foundation/Foundation.h>

@interface AKAccount : NSObject

@property(nonatomic, copy, readonly) NSString *identifier;
@property(nonatomic, copy, readonly) NSString *username;
@property(nonatomic, copy, readonly) NSString *accountType;

- (void)clearCredential;
- (BOOL)isAuthenticated;

@end


// TODO(rcacheaux): Make most of these properties read only.