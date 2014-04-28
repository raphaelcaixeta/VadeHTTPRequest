##What is this?
VadeHTTPRequest is a dead simple ObjC class that allows you to send HTTP requests using AFNetworking with minimalistic syntax. You can still use all features of AFNetworking by just importing **VadeHTTPRequest.h**.

VadeHTTPRequest is nothing more than AFNetworking calls provided in simple methods aiming to target GET and POST requests, with one additional method called "Upload" which handles uploading of files to an HTTP form.

###Why use it?
If you don't want to type the AFNetworking calls every time you want to send a simple GET or POST request, VadeHTTPRequest makes it simple to just call a method. VadeHTTPRequest also takes advantage of ObjC blocks so that you don't rely on "old" delegate calls for request tracking.

###Methods

	- (void)get:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

	- (void)post:(NSString *)endpoint withParams:(NSDictionary *)params onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

	- (void)upload:(NSString *)endpoint withParams:(NSDictionary *)params withFilePath:(NSURL *)fileURL andFileName:(NSString *)fileName onCompletion:(VadeHTTPRequestSuccessBlock)successBlock onFailure:(VadeHTTPRequestFailureBlock)failureBlock;

###How to use it?

Make sure that you have AFNetworking in your project. An example Podfile has also been included in the repo just in case you need it.

Then...

	#import "VadeHTTPRequest.h"

Followed By...

	VadeHTTPRequest *httpInterface = [[VadeHTTPRequest alloc] init];
	
Finally...
	
	[httpInterface get:@"http://google.com" withParams:@{} onCompletion:^void(NSString *response, NSInteger statusCode) { NSLog(@"%@", response); } onFailure:^void(NSError *error, NSInteger statusCode) { NSLog(@"%@", error); }];

###Follow me on Twitter
[@rph](https://twitter.com/rph)