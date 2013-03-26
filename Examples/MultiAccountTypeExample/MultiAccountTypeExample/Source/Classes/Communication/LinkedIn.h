#import <Foundation/Foundation.h>

typedef void (^LIGetPeopleCurrentResponse)(NSDictionary *profile,
                                                         NSError *error);

@interface LinkedIn : NSObject

+ (void)
    getPeopleCurrentWithCompletionHandler:(LIGetPeopleCurrentResponse)completionHandler
                                    token:(NSString *)token;

@end
