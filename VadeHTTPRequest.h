//
//  VadeHTTPRequest.h
//  VadeTest
//
//  Created by Raphael Caixeta on 4/28/14.
//  Copyright (c) 2014 DigitalVade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^VadeHTTPRequestSuccessBlock) (NSString *responseText, NSInteger httpResponseCode);
typedef void (^VadeHTTPRequestFailureBlock) (NSError *error, NSInteger httpResponseCode);

@interface VadeHTTPRequest : NSObject

- (void)get:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

- (void)post:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

- (void)upload:(NSString *)endpoint withParams:(NSDictionary *)params withFilePath:(NSURL *)fileURL andFileName:(NSString *)fileName onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

@end
