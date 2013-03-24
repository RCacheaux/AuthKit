#import <Foundation/Foundation.h>

@class AKAccount;
@class AKAccountType;

typedef void (^AKCompletionHandler)();

@interface AKAccountStore : NSObject

- (AKAccount *)newAccount;
- (AKAccount *)accountWithIdentifier:(NSString *)identifier;
- (AKAccount *)accountWithType:(AKAccountType *)type username:(NSString *)username;
- (void)saveAccount:(AKAccount *)account
    withCompletionHandler:(AKCompletionHandler)completionHandler;

@end
