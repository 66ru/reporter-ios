//
//  HttpPostTransport.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpPostTransport.h"

@implementation HttpPostTransport
@synthesize progressDelegate, requestDelegate;

- (id)initWithMessage:(Message *)aMessage {
    self = [super init];
    if (self) {
        message = [aMessage retain];
    }

    return self;
}

- (void)beginUpload {
    if (message != nil) {
        NSURL *uploadUrl = [NSURL URLWithString:@"http://localhost:8080/reporter.php"];
        httpRequest = [ASIFormDataRequest requestWithURL:uploadUrl];
        httpRequest.delegate = self.requestDelegate;
        [httpRequest setPostValue:message.text forKey:@"text"];
        for(NSUInteger i=0; i<message.photos.count; i++) {
            UIImprovedImage *image = [message.photos objectAtIndex:i];
            [httpRequest addData:image.jpgData withFileName:@"myphoto.jpg" andContentType:@"image/jpeg" forKey:@"photo[]"];
        }
        httpRequest.uploadProgressDelegate = self.progressDelegate;
        [httpRequest startAsynchronous];
    }
}

- (void)dealloc {
    [httpRequest release];
    [message release];
    [super dealloc];
}

@end
