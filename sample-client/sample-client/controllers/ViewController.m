//
//  ViewController.m
//  sample-client
//
//  Created by Juanjo Molinero Horno on 30/08/12.
//  Copyright (c) 2012 Instituto de Biocomputacion y Fisica de Sistemas Complejos. All rights reserved.
//

#import "ViewController.h"
#import "ApplicationState.h"
#import "TKAlertCenter.h"
#import "LoginView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnSend;
@synthesize btnGetTask;
@synthesize btnLogin;

- (void)viewDidLoad {
    [super viewDidLoad];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [self.view endEditing:YES];
    return NO;
}

- (IBAction) btnSendTapped:(id)sender {
    [btnSend setEnabled:NO];
}

- (IBAction) btnGetTaskTapped:(id)sender {
    [btnGetTask setEnabled:NO];
}

- (IBAction) btnLoginTapped:(id)sender {
    ApplicationState* appState = [ApplicationState instance];
    if (!appState.loggedIn) {
        LoginView* loginView = [[LoginView alloc] init];
        loginView.target = self;
        loginView.action = @selector(loginCallback);
        [self presentModalViewController:loginView animated:YES];
    } else {
        // FIXME:[JUANJO] Hay que llamar al logout del servidor
        appState.loggedIn = NO;
        [self.btnLogin setTitle:@"Logout"];
    }
}

- (void) loginCallback {
    ApplicationState* appState = [ApplicationState instance];
    if (!appState.loggedIn) {
        [self.btnLogin setTitle:@"Login"];
    }
}

@end
