//
//  ViewController.m
//  SafariTNG
//
//  Created by frank.novak on 5/14/14.
//  Copyright (c) 2014 PHMobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self goToUrlString:@"http://www.mobilemakers.co"];


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error

{

    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"loading failed :-(";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"that sucks for you"];
    [alert addButtonWithTitle:@"go home"];
    alert.delegate = self;
    [alert show];
    [self.spinner stopAnimating];

}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
   
        [self goToUrlString:@"http://www.mobilemakers.co"];

    }
}

-(void)goToUrlString:(NSString *)urlString

{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}

    /**The TextField checks if it has a delegate when Enter is pressed within it
 The textfields delegate is this viewcontroller instance (self)
     The textfield checks if textfieldshouldreturn: is implemented on its delegate
     the textfield calls textfieldshouuld return:  if it is implemented
     
     thus we can respond to the textfields events
 
 */

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self goToUrlString:textField.text];

    // dismisses keyboard

    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
