//
//  VadeHTTPRequest.m
//  VadeTest
//
//  Created by Raphael Caixeta on 4/28/14.
//  Copyright (c) 2014 DigitalVade. All rights reserved.
//

#import "VadeHTTPRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation VadeHTTPRequest

- (id)init {
    if((self = [super init])) {
    }
    return self;
}

- (void)get:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:endpoint parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *response = [NSString stringWithUTF8String:[operation.responseData bytes]];
        successBlock(response, operation.response.statusCode);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error, operation.response.statusCode);
    }];
    
}

/* MAKES A BASIC POST REQUEST */
- (void)post:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:endpoint parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *response = [NSString stringWithUTF8String:[operation.responseData bytes]];
        successBlock(response, operation.response.statusCode);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error, operation.response.statusCode);
    }];
    
}

/* UPLOADS A FILE TO AN ENDPOINT USING URL-FORM-ENCODED REQUEST */

- (void)upload:(NSString *)endpoint withParams:(NSDictionary *)params withFilePath:(NSURL *)fileURL andFileName:(NSString *)fileName onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:endpoint parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:fileURL name:fileName error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *response = [NSString stringWithUTF8String:[operation.responseData bytes]];
        successBlock(response, operation.response.statusCode);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error, operation.response.statusCode);
    }];
    
}


@end
