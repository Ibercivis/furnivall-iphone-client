//
//  LoginView.h
//  sample-client
//
//  Created by Juanjo Molinero Horno on 10/09/12.
//  Copyright (c) 2012 Instituto de Biocomputacion y Fisica de Sistemas Complejos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIViewController <UITextFieldDelegate> {
    UITextField* txtUser;
    UITextField* txtPassword;
}

@property (strong) IBOutlet UITextField* txtUser;
@property (strong) IBOutlet UITextField* txtPassword;
@property (weak) id target;
@property SEL action;

- (IBAction) btnEnterTapped:(id)sender;
- (IBAction) btnCancelTapped:(id)sender;

@end
