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

@interface MessageViewController : UITableViewController

@property (retain, nonatomic) IBOutlet TextCell *textCell;
@property (retain)Message *message;

- (id)initWithMessage:(Message *)aMessage;

- (void)configureToolbarItems;
- (void)addPhoto;

@end
