#import "LinkedIn.h"

#import <AuthKit/AKAccountStore.h>

#import "LIHTTPClient.h"
#import "MALinkedInAuthController.h"

typedef void (^AFHTTPRequestOperationSuccess)(AFHTTPRequestOperation *operation,
                                              id responseObject);
typedef void (^AFHTTPRequestOperationFailure)(AFHTTPRequestOperation *operation,
                                              NSError *error);

@implementation LinkedIn

+ (void)getPeopleCurrentWithCompletionHandler:
    (LIGetPeopleCurrentResponse)completionHandler {
  NSString *path = @"people/~";
  LIHTTPClient *httpClient = [LIHTTPClient sharedClient];
  AFHTTPRequestOperationSuccess success = ^(AFHTTPRequestOperation *requestOperation,
                                            NSDictionary *JSON){
    NSLog(@"LinkedIn: Profile, %@", JSON);
    completionHandler ? completionHandler(JSON, nil) : NULL;
  };
  AFHTTPRequestOperationFailure failure = ^(AFHTTPRequestOperation *requestOperation,
                                            NSError *error){
    NSLog(@"LinkedIn: ERROR, HTTP Error: %@, for operation, %@", error,requestOperation);
    [[MALinkedInAuthController sharedController]
     unauthenticateAccount:[[AKAccountStore sharedStore] authenticatedAccount]];
  };
  
  [httpClient getPath:path
           parameters:nil
              success:success
              failure:failure];
}

@end
