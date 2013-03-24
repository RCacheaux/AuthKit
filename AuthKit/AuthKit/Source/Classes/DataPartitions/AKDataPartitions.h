#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AKAccount;

extern NSString * const AKDataPartitionStoreURLKey;

@interface AKDataPartitions : NSObject

+ (instancetype)dataPartitionsWithModel:(NSManagedObjectModel *)model;
- (instancetype)initWithModel:(NSManagedObjectModel *)model;
- (NSPersistentStoreCoordinator *)
    persistentStoreCoordinatorForAccount:(AKAccount *)account;

@end
