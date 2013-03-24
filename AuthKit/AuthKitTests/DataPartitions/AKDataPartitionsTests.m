#import <SenTestingKit/SenTestingKit.h>

#import <OCMock/OCMock.h>
#import <CoreData/CoreData.h>

#import "AKAccountStore.h"
#import "AKAccount.h"
#import "AKDataPartitions.h"

@interface AKDataPartitionsTests : SenTestCase
@property(nonatomic, strong) NSManagedObjectModel *model;
@property(nonatomic, strong) AKDataPartitions *dataPartitions;
@property(nonatomic, strong) AKAccount *account;
@end

@implementation AKDataPartitionsTests

- (void)setUp {
  self.model = [[NSManagedObjectModel alloc] init];
  self.dataPartitions = [AKDataPartitions dataPartitionsWithModel:self.model];
  self.account = [[[AKAccountStore alloc] init] newAccount];
}

- (void)testDataParitionForAccount {
  NSPersistentStoreCoordinator *accountPersistentStoreCoordinator =
      [self.dataPartitions persistentStoreCoordinatorForAccount:self.account];
  STAssertNotNil(accountPersistentStoreCoordinator, nil);
  STAssertTrue([accountPersistentStoreCoordinator isKindOfClass:
                [NSPersistentStoreCoordinator class]], nil);
}

- (void)testNewStoreInDataPartitionForAccount {
  NSPersistentStoreCoordinator *accountPersistentStoreCoordinator =
      [self.dataPartitions persistentStoreCoordinatorForAccount:self.account];
  
  NSArray *stores = [accountPersistentStoreCoordinator persistentStores];
  STAssertTrue([stores count] == 1, nil);
  
  NSString *storeURLString = self.account.userInfo[AKDataPartitionStoreURLKey];
  STAssertNotNil(storeURLString, nil);
  STAssertNotNil([NSURL URLWithString:storeURLString], nil);
}

- (void)testExistingStoreInDataPartitionForAccount {
  NSPersistentStoreCoordinator *accountPersistentStoreCoordinator =
      [self.dataPartitions persistentStoreCoordinatorForAccount:self.account];
  NSString *storeURLString = self.account.userInfo[AKDataPartitionStoreURLKey];
  STAssertNotNil(storeURLString, nil);
  STAssertNotNil([NSURL URLWithString:storeURLString], nil);
  
  accountPersistentStoreCoordinator =
      [self.dataPartitions persistentStoreCoordinatorForAccount:self.account];
  NSArray *stores = [accountPersistentStoreCoordinator persistentStores];
  STAssertTrue([stores count] == 1, nil);
  NSString *storeURLStringTwo = self.account.userInfo[AKDataPartitionStoreURLKey];
  
  STAssertEqualObjects(storeURLString, storeURLStringTwo, nil);
}

// TODO(rcacheax): Add hook or comments about tearing down all MOC's when logging out.


@end
