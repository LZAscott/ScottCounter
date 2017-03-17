//
//  ScottCounterEngine.h
//  ScottCounter
//
//  Created by Scott_Mr on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScottCounterConst.h"

@interface ScottCounterEngine : NSObject


/**
 类方法创建一个实例
 */
+ (instancetype)counterEngine;


/**
 在指定时间内从 数字A -> 数字B

 @param startNumber 开始数字
 @param endNumber 结束数字
 @param duration 时长
 @param animationOption 动画类型
 @param currentNumber 当前数字回调
 @param completion 完成后回调
 */
- (void)fromNumber:(CGFloat)startNumber toNumber:(CGFloat)endNumber duration:(CFTimeInterval)duration animationOptions:(ScottCounterAnimationOptions)animationOption currentNumber:(ScottCurrentNumberBlock)currentNumber completion:(ScottCompletionBlock)completion;

@end
