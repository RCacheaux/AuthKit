#import <Foundation/Foundation.h>

@class AKAccountType;

@interface AKAccount : NSObject

@property(nonatomic, copy, readonly) NSString *identifier;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, strong) AKAccountType *accountType;
@property(nonatomic, strong) NSMutableDictionary *userInfo;

@end
