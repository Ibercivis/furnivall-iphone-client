//
//  ApplicationState.h
//  fidiliti
//
//  Created by Juanjo Molinero Horno on 15/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ApplicationState : NSObject {
	BOOL internetActive;
    NSString* user;
    NSString* password;
    NSString* lastErrorMessage;
    MKNetworkEngine* furnivallEngine;
    BOOL loggedIn;
}

@property (nonatomic) BOOL internetActive;
@property (strong) NSString* user;
@property (strong) NSString* password;
@property (strong) NSString* lastErrorMessage;
@property (strong) MKNetworkEngine* furnivallEngine;
@property BOOL loggedIn;

+ (id)instance;

@end
