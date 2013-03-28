#import <SenTestingKit/SenTestingKit.h>

#import "AKAccountStore.h"
#import "AKAccount.h"

@interface AKAccountsTests : SenTestCase
@property(nonatomic, strong) AKAccountStore *accountStore;
@property(nonatomic, strong) AKAccount *accountOne;
@property(nonatomic, copy) NSString *accountOneUsername;
@property(nonatomic, strong) AKAccount *accountTwo;
@property(nonatomic, strong) NSString *accountTwoUsername;
@end

@implementation AKAccountsTests

- (void)setUp {
  [super setUp];
  self.accountStore = [[AKAccountStore alloc] init];
  
  self.accountOneUsername = @"April";
  self.accountOne = [self.accountStore newAccount];
  self.accountOne.username = self.accountOneUsername;
  self.accountTwoUsername = @"Gill";
  self.accountTwo = [self.accountStore newAccount];
  self.accountTwo.username = self.accountTwoUsername;
}

- (void)testSavingAccount {
  NSString *accountUsername = @"John";
  AKAccount *account = [self.accountStore newAccount];
  account.username = accountUsername;
  
  __block BOOL saveComplete = NO;
  AKCompletionHandler completionHandler = ^{
    saveComplete = YES;
  };
  [self.accountStore saveAccount:account withCompletionHandler:completionHandler];
  
  while (!saveComplete) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:[NSDate distantFuture]];
  }
  
  AKAccount *savedAccount = [self.accountStore accountOfType:nil
                                                withUsername:accountUsername];
  STAssertEqualObjects(account.identifier, savedAccount.identifier, nil);
}

- (void)testSavingMultipleAccounts {
  __block BOOL saveComplete = NO;
  AKCompletionHandler completionHandler = ^{
    saveComplete = YES;
  };
  
  [self.accountStore saveAccount:self.accountOne withCompletionHandler:completionHandler];
  while (!saveComplete) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:[NSDate distantFuture]];
  }
  saveComplete = NO;
  [self.accountStore saveAccount:self.accountTwo withCompletionHandler:completionHandler];
  while (!saveComplete) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:[NSDate distantFuture]];
  }
  
  AKAccount *savedAccountOne =
      [self.accountStore accountOfType:nil
                          withUsername:self.accountOneUsername];
  STAssertEqualObjects(self.accountOne.identifier, savedAccountOne.identifier, nil);
  AKAccount *savedAccountTwo =
      [self.accountStore accountOfType:nil
                          withUsername:self.accountTwoUsername];
  STAssertEqualObjects(self.accountTwo.identifier, savedAccountTwo.identifier, nil);
}

- (void)testAccountUserInfoDictionary {
  __block BOOL saveComplete = NO;
  AKCompletionHandler completionHandler = ^{
    saveComplete = YES;
  };
  
  NSString *userInfoItemKey = @"persistentStoreURL";
  NSString *userInfoItemValue = @"store.sqlite";
  self.accountOne.userInfo = [@{userInfoItemKey : userInfoItemValue} mutableCopy];
  [self.accountStore saveAccount:self.accountOne withCompletionHandler:completionHandler];
  while (!saveComplete) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:[NSDate distantFuture]];
  }
  
  AKAccount *savedAccountOne =
      [self.accountStore accountOfType:nil
                          withUsername:self.accountOneUsername];
  STAssertEqualObjects(self.accountOne.userInfo[userInfoItemKey],
                       savedAccountOne.userInfo[userInfoItemKey], nil);
  
}


@end
