//
//  HttpPostTransport.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImprovedImage.h"
#import "Message.h"
#import "ASIFormDataRequest.h"

@interface HttpPostTransport : NSObject <ASIProgressDelegate, ASIHTTPRequestDelegate> {
    ASIFormDataRequest *httpRequest;
    Message *message;
}

@property (assign)id<ASIProgressDelegate> progressDelegate;

- (id)initWithMessage:(Message *)aMessage;

- (void)beginUpload;

@end