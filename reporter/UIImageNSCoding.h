//
//  UIImageNSCoding.h
//  reporter
//
//  Created by Andrey Putilov on 1/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef reporter_UIImageNSCoding_h
#define reporter_UIImageNSCoding_h

@interface UIImage (NSCoding)
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
@end

@implementation UIImage (NSCoding)
- (id)initWithCoder:(NSCoder *)decoder {
    NSData *pngData = [decoder decodeObjectForKey:@"PNGRepresentation"];
    [self autorelease];
    self = [[UIImage alloc] initWithData:pngData];
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:UIImagePNGRepresentation(self) forKey:@"PNGRepresentation"];
}
@end

#endif
