//
//  ViewController.m
//  WindjsUsageSample
//
//  Created by TangQiao on 12-8-28.
//  Copyright (c) 2012年 TangQiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString * path;
    path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString * content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    debugLog(@"bundle path = %@", PATH_OF_BUNDLE);
    [_webView loadHTMLString:content baseURL:[NSURL fileURLWithPath:PATH_OF_BUNDLE]];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString * url = [[request URL] absoluteString];
    debugLog(@"url = %@", url);
    if ([url hasPrefix:@"windjs"]) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Input" message:@"Input your name pls" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        alertView.delegate = self;
        [alertView show];
        return NO;
    }
    return YES;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    debugMethod();
    if (buttonIndex == 1) {
        NSString * name = [alertView textFieldAtIndex:0].text;
        NSString * js = [NSString stringWithFormat:@" $('#message').text('hello %@'); ", name];
        [_webView stringByEvaluatingJavaScriptFromString:js];
    }
}


@end
