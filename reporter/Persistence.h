//
//  Persistence.h
//  reporter
//
//  Created by Alexander Manichev on 18.12.11.
//  Copyright (c) 2011 a.manichev@gmail.com. All rights reserved.
//

#import "Message.h"
#import <Foundation/Foundation.h>

@interface Persistence : NSObject {
    NSString *dataFilePath;
}

- (void)save: (id)Object;
- (id)getObject;

@end
