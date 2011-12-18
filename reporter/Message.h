//
//  Message.h
//  reporter
//
//  Created by Andrey Putilov on 12/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject <NSCoding>

@property (copy)NSString *text;
@property (retain)NSMutableArray *photos; // todo: modify for use not with UIImage, but for NSData

@end
