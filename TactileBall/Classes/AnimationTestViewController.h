//
//  AnimationTestViewController.h
//  AnimationTest
//
//  Created by Galaxy Weblinks on 12/08/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationTestViewController : UIViewController {

	BOOL isViewPushed;
	NSTimer *timer;
	NSInteger x,y;
	NSInteger tagVal, points, missed, level, currentLevel;
	IBOutlet UILabel *lblmissed, *lblpoints, *lbllevel;
	double intervalval;
	
	IBOutlet UIButton *btnpaused;
	BOOL pauseStatus;
	
}
@property (nonatomic, readwrite) BOOL isViewPushed;
@property(nonatomic, retain) NSTimer *timer;

@property(nonatomic, retain) UILabel *lblmissed, *lblpoints, *lbllevel;

@property(nonatomic, retain) UIButton *btnpaused;

- (IBAction)button_touched:(id)sender;

- (void)funAnimate;
- (void)wiggle;

@end

