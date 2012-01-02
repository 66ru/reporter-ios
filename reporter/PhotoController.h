//
//  PhotoController.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "UIImprovedImage.h"
#import "Message.h"
#import "versionCheck.h"

@interface PhotoController : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate> {
    BOOL needToSavePhoto;
}

@property (retain)UIViewController *uiViewController;
@property (retain)Message *message;

- (id)initWithParentController:(UIViewController *)anUIViewController message:(Message *)aMessage;
- (void)showAddPhotoDialog;
//- (void)callWithImagesPickerWithType:(UIImagePickerControllerSourceType)imagePickerSourceType;

@end
