Category of `UIAlertView` that offers a completion handler to listen to interaction. This avoids the need of the implementation of the delegate pattern.

Installation instructions
=========================

1. Import `UIAlertView+Blocks.h` in the desired classes of your project.
2. You has to create the alert the regular way

	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test alert view"
	                                                    message:@"This is a test of an alert view with a completion block instead of the delegate pattern"
	                                                   delegate:nil // Can be another value but will be overridden when showing with handler.
	                                          cancelButtonTitle:@"Cancel"
	                                          otherButtonTitles:@"Button 1", @"Button 2", nil];

3. Now you have a new method to show the alert that passes the completion handler
    
	    [alert showWithHandler:^(UIAlertView *alertView, NSInteger buttonIndex) {
	        
	        if (buttonIndex == [alertView cancelButtonIndex]) {
	            
	            NSLog(@"You clicked the cancel button (index %i)", buttonIndex);
	            
	        } else {
	            
	            NSLog(@"You clicked the button at index %i", buttonIndex);
	        }
	    }];

4. There are some utility selectors to show common alerts.

		// Utility selector to show an alert with a title, a message and a button to dimiss.
		+ (void)showWithTitle:(NSString *)title
		              message:(NSString *)message
		              handler:(UIAlertViewHandler)handler;

		// Utility selector to show an alert with an "Error" title, a message and a button to dimiss.
		+ (void)showErrorWithMessage:(NSString *)message
		                     handler:(UIAlertViewHandler)handler;

		// Utility selector to show an alert with a "Warning" title, a message and a button to dimiss.
		+ (void)showWarningWithMessage:(NSString *)message
		                       handler:(UIAlertViewHandler)handler;

		// Utility selector to show a confirmation dialog with a title, a message and two buttons to accept or cancel.
		+ (void)showConfirmationDialogWithTitle:(NSString *)title
		                                message:(NSString *)message
		                                handler:(UIAlertViewHandler)handler;

5. You can see some examples in `ViewController` class.

Documentation
=============

Execute `appledoc appledoc.plist` in the root of the project path to generate documentation. 