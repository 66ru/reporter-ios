//
//  MessageViewController.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextCell.h"
#import "Message.h"
#import "HttpPostTransport.h"
#import "PhotoController.h"
#import "MessageTextEditController.h"

@interface MessageViewController : UITableViewController <ASIHTTPRequestDelegate> { //todo: implement TransportManagerDelegate
    PhotoController *photoController;
    UILabel *progressLabel;
    UIProgressView *progressView;
    HttpPostTransport *httpPostTransport;
    UIBarButtonItem *sendButton;
}

@property (retain, nonatomic) IBOutlet TextCell *textCell;
@property (retain)Message *message;

- (id)initWithMessage:(Message *)aMessage;

@end
