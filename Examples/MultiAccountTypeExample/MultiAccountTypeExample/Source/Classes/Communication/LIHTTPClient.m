#import "LIHTTPClient.h"

#import <AFNetworking/AFJSONRequestOperation.h>

static NSString * const kAFLinkedInAPIBaseURLString = @"https://api.linkedin.com/v1";
//static NSString * const kIGInstagramClientID = @"439b3f99492943b7b20b0bead946e4ff";
//static NSString * const kIGInstagramClientID = @"18988a9dfa2543bbb5343dcd7ecc6965";

@implementation LIHTTPClient

+ (instancetype)sharedClient {
  static LIHTTPClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient =
        [[LIHTTPClient alloc]
         initWithBaseURL:[NSURL URLWithString:kAFLinkedInAPIBaseURLString]];
  });
  return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
  self = [super initWithBaseURL:url];
  if (!self) {
    return nil;
  }
  [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
  [self setDefaultHeader:@"x-li-format" value:@"json"];
  
  //oauth2_access_token=access_token
  
  return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
  NSMutableDictionary *mutableParameters =
      [NSMutableDictionary dictionaryWithDictionary:parameters];
//  mutableParameters[@"client_id"] = kIGInstagramClientID;
  return [super requestWithMethod:method path:path parameters:[mutableParameters copy]];
}

@end
