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
@property (retain)NSMutableArray *photos;

@end
