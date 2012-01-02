//
//  UIImprovedImage.h
//  reporter
//
//  Created by Andrey Putilov on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImprovedImage : UIImage <NSCoding>
@property (retain) NSData *jpgData;

- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

- (id)initWithJpegData:(NSData *)data;

@end
