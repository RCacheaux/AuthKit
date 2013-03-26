#import "LinkedIn.h"

#import "LIHTTPClient.h"

typedef void (^AFHTTPRequestOperationSuccess)(AFHTTPRequestOperation *operation,
                                              id responseObject);
typedef void (^AFHTTPRequestOperationFailure)(AFHTTPRequestOperation *operation,
                                              NSError *error);

@implementation LinkedIn

+ (void)
    getPeopleCurrentWithCompletionHandler:(LIGetPeopleCurrentResponse)completionHandler
                                    token:(NSString *)token {
  NSString *path = @"people/~";
  
  LIHTTPClient *httpClient = [LIHTTPClient sharedClient];
  NSDictionary *parameters = @{@"oauth2_access_token" : token};
  
  AFHTTPRequestOperationSuccess success = ^(AFHTTPRequestOperation *requestOperation,
                                            NSDictionary *JSON){
    NSLog(@"LinkedIn: Profile, %@", JSON);
    completionHandler ? completionHandler(JSON, nil) : NULL;
  };
  AFHTTPRequestOperationFailure failure = ^(AFHTTPRequestOperation *requestOperation,
                                            NSError *error){
    NSLog(@"LinkedIn: ERROR, HTTP Error: %@, for operation, %@", error,requestOperation);
  };
  
  [httpClient getPath:path
           parameters:parameters
              success:success
              failure:failure];
}

@end
