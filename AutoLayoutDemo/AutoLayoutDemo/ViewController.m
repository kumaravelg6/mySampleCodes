//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by TestUser on 12/08/19.
//  Copyright © 2019 TestUser. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+LayoutHelper.h"
#import "UIView+AutoLayoutHelper.h"

@interface ViewController ()

@end

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [topView setBackgroundColor:UIColor.blueColor];
    [self.view addSubview:topView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    [bottomView setBackgroundColor:UIColor.redColor];
    [self.view addSubview:bottomView];
    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [centerView setBackgroundColor:UIColor.grayColor];
    [self.view addSubview:centerView];
    
    UIView *topRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [topRightView setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:topRightView];
    
//    UIImageView *testImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"close.png"]];
//    testImage.frame = CGRectMake(0, 0, 10, 10);
//    testImage.contentMode = UIViewContentModeScaleToFill;
//    [topRightView addSubview:testImage];
//    [testImage flexibleSizeToView:topRightView widthMultiplier:1.0 heightMultiplier:1.0];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [testView setBackgroundColor:UIColor.greenColor];
    [topRightView addSubview:testView];

    [testView flexibleSizeToView:topRightView widthMultiplier:0.5 heightMultiplier:0.5];
    [testView alignCenterToView:topRightView isVertical:YES isHorizontal:YES topConstant:0 bottomConstant:0 leftConstant:0 rightConstant:0];
    
    //testImage.bottomAnchor
    
    [self alignCenter:topView isVertical:NO isHorizontal:YES topConstant:10 bottomConstant:0 leftConstant:0 rightConstant:0];
    //view.widthAnchor.constraint(equalToConstant: 100).isActive = true
    //[[[topView widthAnchor] constraintEqualToAnchor:self.view.safeAreaLayoutGuide.widthAnchor multiplier:0.5] setActive:YES];
    
    [self flexibleSize:topView widthMultiplier:1.0 heightMultiplier:0];
    
    [self alignCenter:bottomView isVertical:NO isHorizontal:YES topConstant:0 bottomConstant:1 leftConstant:0 rightConstant:0];
    [self flexibleSize:bottomView widthMultiplier:1.0 heightMultiplier:0];
    
    [self alignCenter:centerView isVertical:YES isHorizontal:YES topConstant:0 bottomConstant:0 leftConstant:0 rightConstant:0];
    [self flexibleSize:centerView widthMultiplier:1.0 heightMultiplier:0.5];
    
    [self alignCenter:topRightView isVertical:NO isHorizontal:NO topConstant:20 bottomConstant:0 leftConstant:0 rightConstant:-10];
    //[self flexibleSize:centerView widthMultiplier:1.0 heightMultiplier:0.5];
    
        //[[[bottomView bottomAnchor] constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:50] setActive:YES];
    // Do any additional setup after loading the view.
}



@end
