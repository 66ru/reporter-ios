//
//  MessageTextEditViewController.h
//  reporter
//
//  Created by Alexander Manichev on 18.12.11.
//  Copyright (c) 2011 a.manichev@gmail.com. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface MessageTextEditViewController : UIViewController 

@property (retain) NSString *messageText;
@property (nonatomic, retain) IBOutlet UITextView *text;
@property (retain) id delegate;

- (id)initWithText: (NSString *)aText delegate: (id)delegate;

@end
