#import "AKDataPartitions.h"

#import "AKAccount.h"

NSString * const AKDataPartitionStoreURLKey = @"AKDataPartitionPersistentStoreURL";

@interface AKDataPartitions ()
@property(nonatomic, strong) NSManagedObjectModel *model;
@end

@implementation AKDataPartitions

+ (instancetype)dataPartitionsWithModel:(NSManagedObjectModel *)model {
  return [[self alloc] initWithModel:model];
}

- (instancetype)initWithModel:(NSManagedObjectModel *)model {
  self = [super init];
  if (self) {
    _model = model;
  }
  return self;
}

// TODO(rcacheaux): Invalidate initializer.

- (NSPersistentStoreCoordinator *)
    persistentStoreCoordinatorForAccount:(AKAccount *)account {
  NSPersistentStoreCoordinator *coordinator =
      [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
  
  NSError *error = nil;
  NSURL *storeURL = [self storeURLForAccount:account];
  // TODO(rcacheaux): Make these arguments configurable.
  NSPersistentStore *store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:storeURL
                                                             options:nil
                                                               error:&error];
  if (!store || error) {
    // TODO(rcacheaux): Handle error.]
    return nil;
  }
  
  account.userInfo[AKDataPartitionStoreURLKey] = [[store URL] absoluteString];
  return coordinator;
}

- (NSURL *)storeURLForAccount:(AKAccount *)account {
  NSString *existingStoreURLString = account.userInfo[AKDataPartitionStoreURLKey];
  if (!existingStoreURLString) {
    return [self newURLForNewStore];
  }
  NSURL *storeURL = [NSURL URLWithString:existingStoreURLString];
  if (!storeURL) {
    // TODO(rcacheaux): Log unexpected state.
    return [self newURLForNewStore];
  }
  return storeURL;
}

- (NSURL *)newURLForNewStore {
  NSString *UUIDString = [[NSUUID UUID] UUIDString];
  NSString *storeFileName =
  [NSString stringWithFormat:@"AppDataStore-%@.sqlite", UUIDString];
  return [[self applicationDocumentsDirectory] URLByAppendingPathComponent:storeFileName];
}

// TODO(rcacheaux): Should this base URL be a configuration?
- (NSURL *)applicationDocumentsDirectory {
  return [[[NSFileManager defaultManager]
           URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
