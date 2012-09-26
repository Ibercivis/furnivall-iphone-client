//
//  LoginView.m
//  sample-client
//
//  Created by Juanjo Molinero Horno on 10/09/12.
//  Copyright (c) 2012 Instituto de Biocomputacion y Fisica de Sistemas Complejos. All rights reserved.
//

#import "LoginView.h"
#import "ApplicationState.h"
#import "TKAlertCenter.h"

@interface LoginView ()

@end

@implementation LoginView

@synthesize txtUser;
@synthesize txtPassword;
@synthesize target;
@synthesize action;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [self.view endEditing:YES];
    return NO;
}

- (IBAction) btnEnterTapped:(id)sender {
    ApplicationState* appState = [ApplicationState instance];
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    [params setValue:txtUser.text forKey:@"username"];
    [params setValue:txtPassword.text forKey:@"password"];
    MKNetworkOperation* op = [appState.furnivallEngine operationWithPath:@"api/user/login" params:params httpMethod:@"POST"];
    [op onCompletion:^(MKNetworkOperation* completedOperation) {
        NSDictionary* response = [completedOperation responseJSON];
        if ([[response valueForKey:@"status"] isEqualToString:@"OK"]) {
            [[TKAlertCenter defaultCenter] postAlertWithMessage:[response valueForKey:@"message"]];
            appState.loggedIn = YES;
            [target performSelector:action];
            [self dismissModalViewControllerAnimated:YES];
        } else {
            [[TKAlertCenter defaultCenter] postAlertWithMessage:[response valueForKey:@"message"]];
        }
    } onError:^(NSError* error) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"Error: no se ha podido completar la operación."];
    }];
    
    [appState.furnivallEngine enqueueOperation:op];
}

- (IBAction) btnCancelTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
