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
#import "TransportManager.h"
#import "PhotoController.h"

@interface MessageViewController : UITableViewController //todo: implement TransportManagerDelegate

@property (retain, nonatomic) IBOutlet TextCell *textCell;
@property (retain)Message *message;

- (id)initWithMessage:(Message *)aMessage;

//- (void)addPhoto;

@end
