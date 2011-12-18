//
//  HttpPostTransport.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

@protocol HttpPostTransportDelegate;

@interface HttpPostTransport : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSMutableData *receivedData;
    NSURLConnection *urlConnection;
}

@property (assign)id<HttpPostTransportDelegate> delegate;

- (void)beginUploadMessage:(Message *)message;
- (NSURLRequest *)formPOSTFileDataRequestWithURLWithVariables:(NSURL *)url data:(NSData *)data fileName:(NSString *)fileName variables:(NSMutableDictionary*)variables;

@end


@protocol HttpPostTransportDelegate <NSObject>

@optional
- (void)httpPostTransport:(HttpPostTransport *)httpPostTransport didCompleteUploadWithCode:(NSInteger)code;
- (void)httpPostTransport:(HttpPostTransport *)httpPostTransport didCompleteUploadWithError:(NSError *)error;

@end