//
//  HttpPostTransport.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpPostTransport.h"

@implementation HttpPostTransport 
@synthesize progressDelegate;

- (id)initWithMessage:(Message *)aMessage {
    self = [super init];
    if (self) {
        message = [aMessage retain];
    }

    return self;
}

- (void)beginUpload {
    if (message != nil) {
        NSURL *uploadUrl = [NSURL URLWithString:@"http://localhost/reporter.php"];
        httpRequest = [ASIFormDataRequest requestWithURL:uploadUrl];
        httpRequest.delegate = self;
        [httpRequest setPostValue:@"Ben" forKey:@"first_name"];
        [httpRequest setPostValue:@"Copsey" forKey:@"last_name"];
        UIImprovedImage *image = [message.photos objectAtIndex:0];
        [httpRequest setData:image.jpgData withFileName:@"myphoto.jpg" andContentType:@"image/jpeg" forKey:@"photo[]"];
        httpRequest.uploadProgressDelegate = progressDelegate;
        [httpRequest startAsynchronous];
//        httpRequest.
    }
}

- (void)request:(ASIHTTPRequest *)request didSendBytes:(long long int)bytes {
    //To change the template use AppCode | Preferences | File Templates.
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    //To change the template use AppCode | Preferences | File Templates.

}

- (void)requestStarted:(ASIHTTPRequest *)request {
    //To change the template use AppCode | Preferences | File Templates.

}

- (void)requestFinished:(ASIHTTPRequest *)request {
    //To change the template use AppCode | Preferences | File Templates.

}

- (void)dealloc {
    [httpRequest release];
    [message release];
    [progressDelegate release];
    [super dealloc];
}

@end
