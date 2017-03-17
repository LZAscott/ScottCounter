//
//  UIButton+ScottCounter.m
//  ScottCounter
//
//  Created by Scott_Mr on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "UIButton+ScottCounter.h"
#import <objc/runtime.h>

@implementation UIButton (ScottCounter)

#pragma mark - NSString
- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration format:(ScottFormatBlock)format {
    [self scott_fromNumber:numberA toNumber:numberB duration:duration animationOptions:ScottCounterAnimationOptionCurveEaseInOut format:format completion:nil];
}

- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration format:(ScottFormatBlock)format completion:(ScottCompletionBlock)completion {
    [self scott_fromNumber:numberA toNumber:numberB duration:duration animationOptions:ScottCounterAnimationOptionCurveEaseInOut format:format completion:completion];
}

- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration animationOptions:(ScottCounterAnimationOptions)options format:(ScottFormatBlock)format completion:(ScottCompletionBlock)completion {
    if (self.animationOptions) {
        options = self.animationOptions;
    }
    
    [[ScottCounterEngine counterEngine] fromNumber:numberA toNumber:numberB duration:duration animationOptions:options currentNumber:^(CGFloat number) {
        format ? [self setTitle:format(number) forState:UIControlStateNormal] : nil;
    } completion:completion];
}

#pragma mark - NSAttributedString
- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration attributedFormat:(ScottAttriBlock)attributedFormat {
    [self scott_fromNumber:numberA toNumber:numberB duration:duration animationOptions:ScottCounterAnimationOptionCurveEaseInOut attributedFormat:attributedFormat completion:nil];
}

- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration attributedFormat:(ScottAttriBlock)attributedFormat completion:(ScottCompletionBlock)completion {
    [self scott_fromNumber:numberA toNumber:numberB duration:duration animationOptions:ScottCounterAnimationOptionCurveEaseInOut attributedFormat:attributedFormat completion:completion];
}

- (void)scott_fromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration animationOptions:(ScottCounterAnimationOptions)options attributedFormat:(ScottAttriBlock)attributedFormat completion:(ScottCompletionBlock)completion {
    if (self.animationOptions) {
        options = self.animationOptions;
    }
    
    [[ScottCounterEngine counterEngine] fromNumber:numberA toNumber:numberB duration:duration animationOptions:options currentNumber:^(CGFloat number) {
        attributedFormat ? [self setAttributedTitle:attributedFormat(number) forState:UIControlStateNormal] : nil;
    } completion:completion];
}


#pragma mark - setter & getter
- (void)setAnimationOptions:(ScottCounterAnimationOptions)animationOptions {
    objc_setAssociatedObject(self, &kScottCounterAnimationOptions, @(animationOptions), OBJC_ASSOCIATION_ASSIGN);
}

- (ScottCounterAnimationOptions)animationOptions {
    return [objc_getAssociatedObject(self, &kScottCounterAnimationOptions) integerValue];
}


@end
