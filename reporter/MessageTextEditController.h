//
//  MessageTextEditController.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface MessageTextEditController : UIViewController {
    UITextView *textField;
}

@property (retain)Message *message;

- (id)initWithMessage:(Message *)aMessage;

@end
