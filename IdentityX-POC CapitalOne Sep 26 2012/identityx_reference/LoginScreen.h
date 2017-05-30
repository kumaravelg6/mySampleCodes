//
//  LoginScreen.h
//  NavBased
//
//  Created by icore on 08/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IXAll.h" // For IdentityX

@interface LoginScreen : UIViewController<UITextFieldDelegate> {

    
	IBOutlet UITextField *txt_username, *txt_password;
	IBOutlet UIButton *btn_login;
	
}




@property (nonatomic, retain) UITextField *txt_username, *txt_password;
@property (nonatomic, retain) UIButton *btn_login;


-(IBAction)Login_clicked:(id)sender;


-(IBAction)Home_clicked:(id)sender;


-(NSString *)validate_login;

-(void)show_alert:(NSString *)msg;



@end
