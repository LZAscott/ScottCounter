//
//  ScottCounterConst.h
//  ScottCounter
//
//  Created by Scott_Mr on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const kScottCounterAnimationOptions;

typedef void(^ScottCompletionBlock)(void);

typedef void(^ScottCurrentNumberBlock)(CGFloat number);

typedef NSString *(^ScottFormatBlock)(CGFloat number);

typedef NSAttributedString *(^ScottAttriBlock)(CGFloat number);


typedef NS_ENUM(NSUInteger, ScottCounterAnimationOptions) {
    /** 由慢到快,再由快到慢*/
    ScottCounterAnimationOptionCurveEaseInOut = 1,
    /** 由慢到快*/
    ScottCounterAnimationOptionCurveEaseIn,
    /** 由快到慢*/
    ScottCounterAnimationOptionCurveEaseOut,
    /** 匀速*/
    ScottCounterAnimationOptionCurveLinear
};


