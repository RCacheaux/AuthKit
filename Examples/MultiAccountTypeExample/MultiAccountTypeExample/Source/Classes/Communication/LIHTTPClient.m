#import "LIHTTPClient.h"

#import <AuthKit/AKAccountStore.h>
#import <AuthKit/AKAccount.h>
#import <AFNetworking/AFJSONRequestOperation.h>

#import "AKGTMOAuth2Account.h"
#import "AKOAuth2AccountCredential.h"

static NSString * const kAFLinkedInAPIBaseURLString = @"https://api.linkedin.com/v1";

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
  return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
  NSMutableDictionary *mutableParameters =
      [NSMutableDictionary dictionaryWithDictionary:parameters];
  AKGTMOAuth2Account *masterAccount =
      (AKGTMOAuth2Account *)[[AKAccountStore sharedStore] authenticatedAccount];
  
  [mutableParameters setObject:masterAccount.OAuth2Credential.accessToken
                        forKey:@"oauth2_access_token"];
  return [super requestWithMethod:method path:path parameters:[mutableParameters copy]];
}

@end
