//
//  ViewController.h
//  sample-client
//
//  Created by Juanjo Molinero Horno on 30/08/12.
//  Copyright (c) 2012 Instituto de Biocomputacion y Fisica de Sistemas Complejos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    UIBarButtonItem* btnSend;
    UIBarButtonItem* btnGetTask;
    UIBarButtonItem* btnLogin;
    UILabel* firstNumber;
    UILabel* secondNumber;
}

@property (strong) IBOutlet UIBarButtonItem* btnSend;
@property (strong) IBOutlet UIBarButtonItem* btnGetTask;
@property (strong) IBOutlet UIBarButtonItem* btnLogin;
@property (strong) IBOutlet UILabel* firstNumber;
@property (strong) IBOutlet UILabel* secondNumber;

- (IBAction) btnSendTapped:(id)sender;
- (IBAction) btnGetTaskTapped:(id)sender;
- (IBAction) btnLoginTapped:(id)sender;
- (void) loginCallback;

@end
