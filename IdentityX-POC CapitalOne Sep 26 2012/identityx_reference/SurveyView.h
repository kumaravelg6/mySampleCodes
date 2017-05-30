//
//  SurveyView.h
//  identityx_reference
//
//  Created by Yasaswi M on 18/09/12.
//  Copyright (c) 2012 yasaswi.maddala@wipro.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyView : UIViewController<UIWebViewDelegate>
{
    UIWebView *webView;
}

@property(nonatomic, retain) IBOutlet UIWebView *webView;

@end


