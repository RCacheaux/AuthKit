#import "AKAccount.h"

@interface AKAccount ()

@property(nonatomic, copy, readwrite) NSString *username;
@property(nonatomic, copy, readwrite) NSString *accountType;

+ (instancetype)accountWithIdentifier:(NSString *)identifier;

@end
