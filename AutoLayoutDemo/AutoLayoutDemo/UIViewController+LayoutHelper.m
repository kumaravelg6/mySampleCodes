//
//  UIView+LayoutHelper.m
//  AutoLayoutDemo
//
//  Created by TestUser on 12/08/19.
//  Copyright © 2019 TestUser. All rights reserved.
//

#import "UIViewController+LayoutHelper.h"

@implementation UIViewController (LayoutHelper)

-(void)flexibleSize:(UIView *)myView widthMultiplier:(CGFloat)widthMultiplier heightMultiplier:(CGFloat)heightMultiplier {
    //myView.translatesAutoresizingMaskIntoConstraints = NO;
    if (@available(iOS 11, *)) {
        if(widthMultiplier != 0) {
            //[self alignCenter:myView isVertical:NO isHorizontal:YES topConstant:0 bottomConstant:0 leftConstant:0 rightConstant:0];
            [myView.widthAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.widthAnchor multiplier:widthMultiplier].active = YES;
        }
        if(heightMultiplier != 0) {
            [myView.heightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.heightAnchor multiplier:heightMultiplier].active = YES;
        }
    } else {
        if(widthMultiplier != 0) {
            [myView.widthAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.widthAnchor multiplier:widthMultiplier].active = YES;
        }
        if(heightMultiplier != 0) {
            [myView.heightAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.heightAnchor multiplier:heightMultiplier].active = YES;
        }
    }
    
    //[myView layoutIfNeeded];
}

// MARK:- Alignment methods
-(void)alignCenter:(UIView *)myView isVertical:(BOOL)isVertical isHorizontal:(BOOL)isHorizontal topConstant:(CGFloat)topConstant bottomConstant:(CGFloat)bottomConstant leftConstant:(CGFloat)leftConstant rightConstant:(CGFloat)rightConstant {
    // initialize view using IBOutlet or programtically
    myView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [[myView.widthAnchor constraintEqualToConstant:myView.frame.size.width] setActive:YES];
    [[myView.heightAnchor constraintEqualToConstant:myView.frame.size.height] setActive:YES];
    
    if (@available(iOS 11, *)) {
        if(isHorizontal){
            [[myView.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor] setActive:YES];
            //[[myView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setConstant:myView.frame.origin.y];
        }
        if(topConstant != 0) {
            [myView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:topConstant].active = YES;
        }
        
        if(isVertical){
            [[myView.centerYAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerYAnchor] setActive:YES];
        }
        if(bottomConstant != 0) {
            [myView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:bottomConstant].active = YES;
        }
        if(leftConstant != 0) {
            [myView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:leftConstant].active = YES;
        }
        if(rightConstant != 0) {
            [myView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:rightConstant].active = YES;
        }
    }else {
        if(isHorizontal){
            [[myView.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor] setActive:YES];
        }
        
        if(topConstant != 0) {
            [myView.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor constant:topConstant].active = YES;
        }
        
        if(isVertical){
            [[myView.centerYAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerYAnchor] setActive:YES];
        }
        
        if(bottomConstant != 0) {
            [myView.bottomAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.bottomAnchor constant:bottomConstant].active = YES;
        }
        
        if(leftConstant != 0) {
            [myView.leftAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leftAnchor constant:bottomConstant].active = YES;
        }
        
        if(rightConstant != 0) {
            [myView.rightAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.rightAnchor constant:rightConstant].active = YES;
        }
        
        //        UILayoutGuide *margins = self.view.layoutMarginsGuide;
        //        [myView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
        //        [myView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
        //        [myView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor].active = YES;
        //        [myView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor].active = YES;
    }
    
    //[myView layoutIfNeeded];
}

@end
