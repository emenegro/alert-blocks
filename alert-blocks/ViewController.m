//
//  ViewController.m
//  MNMAlert
//
//  Created by Mario Negro on 28/01/13.
//
//

#import "ViewController.h"
#import "UIAlertView+Blocks.h"

@interface ViewController ()

- (IBAction)alertButtonClicked:(id)sender;
- (IBAction)warningButtonClicked:(id)sender;
- (IBAction)errorButtonClicked:(id)sender;
- (IBAction)dialogButtonClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertButtonClicked:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test alert view"
                                                    message:@"This is a test of an alert view with a completion block instead of the delegate pattern"
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Button 1", @"Button 2", nil];
    
    [alert showWithHandler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        
        if (buttonIndex == [alertView cancelButtonIndex]) {
            
            NSLog(@"You clicked the cancel button (index %i)", buttonIndex);
            
        } else {
            
            NSLog(@"You clicked the button at index %i", buttonIndex);
            
        }
    }];
}

- (IBAction)warningButtonClicked:(id)sender {
    
    [UIAlertView showWarningWithMessage:@"This is a warning"
                                handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                    
                                    NSLog(@"Warning dismissed");
                                }];
    
}

- (IBAction)errorButtonClicked:(id)sender {
    
    [UIAlertView showErrorWithMessage:@"Oh My, an error!"
                              handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                  
                                  NSLog(@"Error dismissed");
                              }];
}

- (IBAction)dialogButtonClicked:(id)sender {
    
    [UIAlertView showConfirmationDialogWithTitle:@"Confirmation dialog"
                                         message:@"Do you think this control is useful?"
                                         handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                             
                                             if (buttonIndex == [alertView cancelButtonIndex]) {
                                                 
                                                 [UIAlertView showWithTitle:@"Sad :-("
                                                                    message:@"So, make a suggestion, please! You can write me where you downloaded this code."
                                                                    handler:nil];
                                                 
                                             } else {
                                                 
                                                 [UIAlertView showWithTitle:@"Happy! :-)"
                                                                    message:@"Thank you so much!"
                                                                    handler:nil];
                                             }
                                         }];
}

@end
