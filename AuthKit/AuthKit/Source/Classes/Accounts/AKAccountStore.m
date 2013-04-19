#import "AKAccountStore.h"

#import "AKAccount_Protected.h"

// TODO(rcacheaux): Enforce unique username for each account of type n.
@interface AKAccountStore ()
@property(nonatomic, strong) NSMutableDictionary *accounts;
@property(nonatomic, strong) AKAccount *masterAccount;
@property(nonatomic, assign) Class accountTypeClass;
@end

@implementation AKAccountStore

+ (instancetype)sharedStore {
  static AKAccountStore *_sharedStore = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedStore = [[self alloc] init];
  });
  return _sharedStore;
}

- (id)init {
  self = [super init];
  if (self) {
    _accounts = [NSMutableDictionary dictionary];
    _accountTypeClass = [AKAccount class];
  }
  return self;
}

- (void)registerAccountTypeClass:(Class)accountTypeClass {
  self.accountTypeClass = accountTypeClass;
}

- (AKAccount *)newAccount; {
  // TODO(rcacheaux): Cache identifiers for new unsaved accounts to make sure
  // the save method only saves accounts created from this class.
  AKAccount *newAccount =
      [self.accountTypeClass accountWithIdentifier:[[NSUUID UUID] UUIDString]];
  return newAccount;
}

- (AKAccount *)accountOfType:(NSString *)type withUsername:(NSString *)username {
  for (NSString *identifier in self.accounts) {
    AKAccount *account = self.accounts[identifier];
    if ([account.username isEqualToString:username]) {
      return account;
    }
  }
  return nil;
}

- (AKAccount *)accountWithIdentifier:(NSString *)identifier {
  return self.accounts[identifier];
}

- (void)saveAccount:(AKAccount *)account {
  self.masterAccount = account;
}

- (AKAccount *)authenticatedAccount {
  if ([self.masterAccount isAuthenticated]) {
    return self.masterAccount;
  }
  return nil;
}

@end
