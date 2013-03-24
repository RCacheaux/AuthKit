#import "AKAccount.h"

#import "AKAccount_Protected.h"

@interface AKAccount ()
@property(nonatomic, copy, readwrite) NSString *identifier;
@end

@implementation AKAccount

+ (instancetype)accountWithIdentifier:(NSString *)identifier {
  return [[self alloc] initWithIdentifier:identifier];
}

- (instancetype)initWithIdentifier:(NSString *)identifier {
  self = [super init];
  if (self) {
    _identifier = identifier;
    _userInfo = [NSMutableDictionary dictionary];
  }
  return self;
}

// TODO(rcacheaux): Invalidate default initializer.

@end
