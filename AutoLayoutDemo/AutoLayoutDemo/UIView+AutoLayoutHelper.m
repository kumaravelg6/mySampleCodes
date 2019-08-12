//
//  UIView+LayoutHelper.m
//  AutoLayoutDemo
//
//  Created by TestUser on 12/08/19.
//  Copyright © 2019 TestUser. All rights reserved.
//

#import "UIView+AutoLayoutHelper.h"

@implementation UIView (AutoLayoutHelper)

// MARK:- Layout Helper methods
-(void)flexibleSizeToView:(UIView *)toView widthMultiplier:(CGFloat)widthMultiplier heightMultiplier:(CGFloat)heightMultiplier {
   
    self.translatesAutoresizingMaskIntoConstraints = NO;
   
    if(widthMultiplier != 0) {
        [self.widthAnchor constraintEqualToAnchor:toView.widthAnchor multiplier:widthMultiplier].active = YES;
    }
    if(heightMultiplier != 0) {
        [self.heightAnchor constraintEqualToAnchor:toView.heightAnchor multiplier:heightMultiplier].active = YES;
    }
}


-(void)alignCenterToView:(UIView *)toView isVertical:(BOOL)isVertical isHorizontal:(BOOL)isHorizontal topConstant:(CGFloat)topConstant bottomConstant:(CGFloat)bottomConstant leftConstant:(CGFloat)leftConstant rightConstant:(CGFloat)rightConstant {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [[self.widthAnchor constraintEqualToConstant:toView.frame.size.width] setActive:YES];
    [[self.heightAnchor constraintEqualToConstant:toView.frame.size.height] setActive:YES];
    
    if(isHorizontal){
        [[self.centerXAnchor constraintEqualToAnchor:toView.centerXAnchor] setActive:YES];
    }
    if(isVertical){
        [[self.centerYAnchor constraintEqualToAnchor:toView.centerYAnchor] setActive:YES];
    }
    
    if(topConstant != 0) {
        [self.topAnchor constraintEqualToAnchor:toView.topAnchor constant:topConstant].active = YES;
    }
    if(bottomConstant != 0) {
        [self.bottomAnchor constraintEqualToAnchor:toView.bottomAnchor constant:bottomConstant].active = YES;
    }
    if(leftConstant != 0) {
        [self.leftAnchor constraintEqualToAnchor:toView.leftAnchor constant:leftConstant].active = YES;
    }
    if(rightConstant != 0) {
        [self.rightAnchor constraintEqualToAnchor:toView.rightAnchor constant:rightConstant].active = YES;
    }
    
}

@end
