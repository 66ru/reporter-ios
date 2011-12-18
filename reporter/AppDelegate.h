//
//  AppDelegate.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import "Persistence.h"
#import <UIKit/UIKit.h>
#import "MessageViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *navigationController;
    MessageViewController *messageViewController;
    Persistence *persistence;
    
}

@property (strong, nonatomic) UIWindow *window;

@end
