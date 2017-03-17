//
//  UIButton+ScottCounter.h
//  ScottCounter
//
//  Created by Scott_Mr on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScottCounterEngine.h"

@interface UIButton (ScottCounter)

/// 动画类型
@property (nonatomic, assign) ScottCounterAnimationOptions animationOptions;


#pragma mark - NSString
/**
 正常字体属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param format 设置字体的Block
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
                  format:(ScottFormatBlock)format;


/**
 正常字体属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param format 设置字体的Block
 @param completion 完成后的回调
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
                  format:(ScottFormatBlock)format
              completion:(ScottCompletionBlock)completion;


/**
 正常字体属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param options 动画类型
 @param format 设置字体的Block
 @param completion 完成后的回调
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
        animationOptions:(ScottCounterAnimationOptions)options
                  format:(ScottFormatBlock)format
              completion:(ScottCompletionBlock)completion;


#pragma mark - NSAttributedString
/**
 富文本属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param attributedFormat 设置富文本字体的Block
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
        attributedFormat:(ScottAttriBlock)attributedFormat;


/**
 富文本属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param attributedFormat 设置富文本的Block
 @param completion 完成后回调
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
        attributedFormat:(ScottAttriBlock)attributedFormat
              completion:(ScottCompletionBlock)completion;


/**
 富文本属性UILabel中的数字在指定时间从 数字A -> 数字B
 
 @param numberA 开始数字
 @param numberB 结束数字
 @param duration 时长
 @param options 动画类型
 @param attributedFormat 设置富文本的Block
 @param completion 完成后回调
 */
- (void)scott_fromNumber:(CGFloat)numberA
                toNumber:(CGFloat)numberB
                duration:(CFTimeInterval)duration
        animationOptions:(ScottCounterAnimationOptions)options
        attributedFormat:(ScottAttriBlock)attributedFormat
              completion:(ScottCompletionBlock)completion;



@end
