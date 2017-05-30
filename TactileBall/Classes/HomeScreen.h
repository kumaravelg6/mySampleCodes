//
//  HomeScreen.h
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Instructions;

@interface HomeScreen : UIViewController {

	IBOutlet UIButton *btnPlay; 
	UINavigationController *navigationController;
	UIToolbar *toolbar;
	UINavigationController *infoNavController;
	Instructions *ivControllerToolbar;
	IBOutlet UIButton *btnHelp;

}

@property (nonatomic, retain) IBOutlet UIButton *btnPlay;
@property (nonatomic, retain) IBOutlet UIButton *btnHelp;
@property (nonatomic, retain) UIToolbar *toolbar;

- (IBAction)btnHelp_click;
- (IBAction)btnPlay_click;

@end
