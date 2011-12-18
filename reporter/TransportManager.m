//
//  TransportManager.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TransportManager.h"

@implementation TransportManager
@synthesize delegate;

- (void)sendMessage:(Message *)message {
    HttpPostTransport *httpPostTransport = [[[HttpPostTransport alloc] init] autorelease];
    [httpPostTransport beginUploadMessage:message];
}

-(void)httpPostTransport:(HttpPostTransport *)httpPostTransport didCompleteUploadWithCode:(NSInteger)code {
    [delegate transportManager:self didFinishUpload:code];
}

-(void)httpPostTransport:(HttpPostTransport *)httpPostTransport didCompleteUploadWithError:(NSError *)error {
    [delegate transportManager:self didFinishUploadWithError:error];
}

@end
