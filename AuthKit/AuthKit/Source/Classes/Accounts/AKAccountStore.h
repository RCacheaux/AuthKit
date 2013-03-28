#import <Foundation/Foundation.h>

@class AKAccount;
@class AKAccountType;

typedef void (^AKCompletionHandler)();

@interface AKAccountStore : NSObject

+ (instancetype)sharedStore;

- (AKAccount *)newAccountOfType:(Class)type;
- (AKAccount *)accountWithIdentifier:(NSString *)identifier;
- (AKAccount *)accountOfType:(NSString *)type withUsername:(NSString *)username;
- (void)saveAccount:(AKAccount *)account
    withCompletionHandler:(AKCompletionHandler)completionHandler;
- (AKAccount *)authenticatedMasterAccount;

// TODO(rcacheaux): Remove temporary method.
- (void)saveMasterAccount:(AKAccount *)account;


//- (NSArray *)masterAccounts;
//- (NSArray *)authenticatedAccountsOfType:(NSString *)type;

@end
