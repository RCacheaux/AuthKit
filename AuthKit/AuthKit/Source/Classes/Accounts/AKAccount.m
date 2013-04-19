#import "AKAccount.h"

#import "AKAccount_Protected.h"

@interface AKAccount ()
@property(nonatomic, copy, readwrite) NSString *identifier;

@end

@implementation AKAccount

+ (instancetype)accountWithIdentifier:(NSString *)identifier {
  return [[self alloc] initWithIdentifier:identifier];
}

- (id)initWithIdentifier:(NSString *)identifier {
  self = [super init];
  if (self) {
    _identifier = identifier;
  }
  return self;
}

- (void)clearCredential {
  // Abstract method.
}

- (BOOL)isAuthenticated {
  return NO;
}

@end


// TODO(rcacheaux): Invalidate default initializer.