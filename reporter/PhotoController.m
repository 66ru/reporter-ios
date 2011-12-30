//
//  PhotoController.m
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoController.h"

@implementation PhotoController
@synthesize uiViewController, message;

- (id)init {
    self = [super init];
    if (self) {
        needToSavePhoto = NO;
    }
    return self;
}

- (void)dealloc {
    [uiViewController release];
    [message release];
    [super dealloc];
}

- (id)initWithParentController:(UIViewController *)anUIViewController message:(Message *)aMessage {
    self = [self init];
    if (self) {    
        self.uiViewController = anUIViewController;
        self.message = aMessage;
    }
    return self;
}

- (void)showAddPhotoDialog {
    UIActionSheet *popupQuery = nil;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]==YES) {
        popupQuery = [[UIActionSheet alloc] 
                      initWithTitle:@"Выберите источник" 
                      delegate:self 
                      cancelButtonTitle:@"Отмена" 
                      destructiveButtonTitle:nil 
                      otherButtonTitles:@"Сделать фото", @"Открыть галерею", 
                      nil];
    } else {
        popupQuery = [[UIActionSheet alloc] 
                      initWithTitle:@"Выберите источник" 
                      delegate:self 
                      cancelButtonTitle:@"Отмена" 
                      destructiveButtonTitle:nil
                      otherButtonTitles:@"Открыть галерею", 
                      nil];
    }
    
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
	[popupQuery showInView:self.uiViewController.view];
	[popupQuery release];
}

- (void)callWithImagesPickerWithType:(UIImagePickerControllerSourceType)imagePickerSourceType {
    
    if (([UIImagePickerController isSourceTypeAvailable:imagePickerSourceType] == NO))
        return;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = imagePickerSourceType;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = self;
    
    [self.uiViewController presentModalViewController: mediaUI animated: YES];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    BOOL gotCamera = [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera];
	
    if ((gotCamera && buttonIndex == 0)) {
        needToSavePhoto = YES;
        [self callWithImagesPickerWithType:UIImagePickerControllerSourceTypeCamera];
    } else if((gotCamera && buttonIndex == 1) || (!gotCamera && buttonIndex == 0)) {
        [self callWithImagesPickerWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if(SYSTEM_VERSION_LESS_THAN(@"5.0")) {
        [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    } else {
        [[picker presentingViewController] dismissModalViewControllerAnimated: YES];
    }
    [picker release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        UIImage *myImage = (UIImage *) [info objectForKey: UIImagePickerControllerOriginalImage];
        
        if (needToSavePhoto) {
            UIImageWriteToSavedPhotosAlbum(myImage, nil, nil , nil);
            needToSavePhoto = NO;
        }
        
        [[message mutableArrayValueForKey:@"photos"] addObject:myImage];
    }
    
    [picker.presentingViewController dismissModalViewControllerAnimated: YES];
    [picker release];
}

@end
