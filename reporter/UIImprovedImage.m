//
//  UIImprovedImage.m
//  reporter
//
//  Created by Andrey Putilov on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImprovedImage.h"

@implementation UIImprovedImage
@synthesize jpgData;

- (void)dealloc {
    [jpgData release];
    [super dealloc];
}

- (id)initWithJpegData:(NSData *)data {
    self = [self initWithData:data];
    self.jpgData = data;
    
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self.jpgData = [decoder decodeObjectForKey:@"JPGRepresentation"];
    [self initWithData:jpgData];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    if (jpgData == nil)
        self.jpgData = UIImageJPEGRepresentation(self, 0.9);
    [encoder encodeObject:jpgData forKey:@"JPGRepresentation"];
}

@end
