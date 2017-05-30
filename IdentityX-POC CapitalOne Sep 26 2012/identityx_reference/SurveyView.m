//
//  SurveyView.m
//  identityx_reference
//
//  Created by Yasaswi M on 18/09/12.
//  Copyright (c) 2012 yasaswi.maddala@wipro.com. All rights reserved.
//

#import "SurveyView.h"


@implementation SurveyView

@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *urlAddress = @"http://www.surveymonkey.com/s/7JF72W3";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
       
    self.title = @"Survey";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *yourHTMLSourceCodeString = [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('h1')[0].innerText;"];
    
    NSRange rangeValue = [yourHTMLSourceCodeString rangeOfString:@"Thanks" options:NSCaseInsensitiveSearch];
    
    if (rangeValue.location == NSNotFound) {
        NSLog(@"Survey not submitted");
    }else {
        NSLog(@"Survey submitted");
    }

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
