//
//  MessageTextEditController.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageTextEditController.h"

@implementation MessageTextEditController
@synthesize message;

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithMessage:(Message *)aMessage {
    self = [self init];
    if (self) {
        self.title = @"Текст";
        self.message = aMessage;
        
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Сохранить" style:UIBarButtonItemStyleDone target:self action:@selector(saveText)];
        self.navigationItem.rightBarButtonItem = saveButton;
        [saveButton release];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Отменить" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
        self.navigationItem.leftBarButtonItem = cancelButton;
        [cancelButton release];
        
        textField = [[UITextView alloc] init];
        textField.text = message.text;
        textField.scrollEnabled = YES;
        textField.editable = YES;
        textField.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:textField];
        [textField becomeFirstResponder];
    }
    return self;
}

- (void)saveText {
    [self.navigationController popViewControllerAnimated:YES];
    self.message.text = textField.text; // need to ve after popViewController for uitextview autocomplete
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark Responding to keyboard events

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    CGFloat keyboardTop = keyboardRect.origin.y;
    CGRect newTextViewFrame = self.view.bounds;
    newTextViewFrame.size.height = keyboardTop - self.view.bounds.origin.y;
    
    textField.frame = newTextViewFrame;
}

#pragma mark - View lifecycle

- (void)dealloc {
    [textField release];
    [message release];
    [super dealloc];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
