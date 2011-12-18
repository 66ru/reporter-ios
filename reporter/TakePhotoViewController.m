//
//  TakePhotoViewController.m
//  reporter
//
//  Created by Nikita Hismatov on 18.12.11.
//  Copyright (c) 2011 hismatovns@gmail.com. All rights reserved.
//

#import "TakePhotoViewController.h"

@implementation TakePhotoViewController

@synthesize button1, imageView1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self->needToSavePhoto = NO;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)callWithImagesPickerWithType:(UIImagePickerControllerSourceType)imagePickerSourceType {
    
    // галерея есть у всех?
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
    
    [self presentModalViewController: mediaUI animated: YES];
}

// UIImagePickerControllerDelegate implementation


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
        
        if (self->needToSavePhoto) {
            UIImageWriteToSavedPhotosAlbum(myImage, nil, nil , nil);
            self->needToSavePhoto = NO;
        }
        
        self.imageView1.image = myImage;
    }

    [picker.presentingViewController dismissModalViewControllerAnimated: YES];
    [picker release];
}

// Action sheet

-(IBAction)showActionSheet:(id)sender {
    UIActionSheet *popupQuery = nil;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]==YES) {
         popupQuery = [[UIActionSheet alloc] 
                                     initWithTitle:@"Выбрать источник" 
                                     delegate:self 
                                     cancelButtonTitle:@"Отмена" 
                                     destructiveButtonTitle:nil 
                                     otherButtonTitles:@"Сделать фото", @"Открыть галерею", 
                                     nil];
    } else {
         popupQuery = [[UIActionSheet alloc] 
                                     initWithTitle:@"Выбрать источник" 
                                     delegate:self 
                                     cancelButtonTitle:@"Отмена" 
                                     destructiveButtonTitle:nil
                                     otherButtonTitles:@"Открыть галерею", 
                                     nil];
    }
	
    
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;

	[popupQuery showInView:self.view];
	[popupQuery release];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    BOOL gotCamera = [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera];
	
    if ((gotCamera && buttonIndex == 0)) {
        self->needToSavePhoto=YES;
        [self callWithImagesPickerWithType:UIImagePickerControllerSourceTypeCamera];
    } else if((gotCamera && buttonIndex == 1) || (!gotCamera && buttonIndex == 0)) {
        [self callWithImagesPickerWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}


@end
