#import <Foundation/Foundation.h>

@class AKAccount;

@interface AKAccountStore : NSObject

+ (instancetype)sharedStore;
- (void)registerAccountTypeClass:(Class)accountTypeClass;
- (AKAccount *)newAccount;
- (void)saveAccount:(AKAccount *)account;
- (AKAccount *)authenticatedAccount;

@end


// Leave child accounts for AuthKit v2.
//- (AKAccount *)accountWithIdentifier:(NSString *)identifier;
//- (AKAccount *)accountOfType:(NSString *)type withUsername:(NSString *)username;
// Will only return if master is authenticated.
//- (NSArray *)childAccountsForMasterAccount:(AKAccount *)masterAccount;
// TODO(rcacheaux): Remove temporary method.
//- (void)saveMasterAccount:(AKAccount *)account;
//- (NSArray *)masterAccounts;
//- (NSArray *)authenticatedAccountsOfType:(NSString *)type;


// Should ONLY be able to access authenticated accounts.