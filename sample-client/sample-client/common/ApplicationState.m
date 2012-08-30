//
//  ApplicationState.m
//  fidiliti
//
//  Created by Juanjo Molinero Horno on 15/02/11.
//  Copyright 2011 Fidiliti. All rights reserved.
//

#import "ApplicationState.h"

static ApplicationState* sharedInstance = nil;

@implementation ApplicationState

@synthesize internetActive;
@synthesize user;
@synthesize password;
@synthesize lastErrorMessage;

#pragma mark Singleton Methods
// FIXME: [JUANJO] Mirar como se hacen singletons con ARC
+ (id) instance {
    @synchronized(self) {
        if(sharedInstance == nil)
            sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

- (id) copyWithZone:(NSZone*)zone {
    return self;
}


- (id) init {
    if (self == [super init]) {
        internetActive = FALSE;
    }
    return self;
}

@end
