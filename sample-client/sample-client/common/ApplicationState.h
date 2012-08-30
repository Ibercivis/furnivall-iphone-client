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
}

@property (nonatomic) BOOL internetActive;
@property (nonatomic, retain) NSString* user;
@property (nonatomic, retain) NSString* password;
@property (nonatomic, retain) NSString* lastErrorMessage;

+ (id)instance;

@end
