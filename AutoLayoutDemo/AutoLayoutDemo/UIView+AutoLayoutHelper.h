//
//  UIView+LayoutHelper.h
//  AutoLayoutDemo
//
//  Created by TestUser on 12/08/19.
//  Copyright © 2019 TestUser. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AutoLayoutHelper)

-(void)flexibleSizeToView:(UIView *)toView widthMultiplier:(CGFloat)widthMultiplier heightMultiplier:(CGFloat)heightMultiplier;

-(void)alignCenterToView:(UIView *)toView isVertical:(BOOL)isVertical isHorizontal:(BOOL)isHorizontal topConstant:(CGFloat)topConstant bottomConstant:(CGFloat)bottomConstant leftConstant:(CGFloat)leftConstant rightConstant:(CGFloat)rightConstant;


@end

NS_ASSUME_NONNULL_END
