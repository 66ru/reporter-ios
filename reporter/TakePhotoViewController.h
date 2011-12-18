//
//  TakePhotoViewController.h
//  reporter
//
//  Created by Nikita Hismatov on 18.12.11.
//  Copyright (c) 2011 hismatovns@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface TakePhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(retain) IBOutlet UIButton* button1;

- (IBAction)buttonTouched:(id)sender;

@end
