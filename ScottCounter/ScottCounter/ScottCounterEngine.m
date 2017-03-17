//
//  ScottCounterEngine.m
//  ScottCounter
//
//  Created by Scott_Mr on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "ScottCounterEngine.h"

typedef CGFloat (*ScottCurrentBufferFunction)(CGFloat);

@interface ScottCounterEngine ()

/// 开始数字
@property (nonatomic, assign) CGFloat startNumber;
/// 结束数字
@property (nonatomic, assign) CGFloat endNumber;
/// 定时器
@property (nonatomic, strong) CADisplayLink *timer;
/// 总时长
@property (nonatomic, assign) CFTimeInterval durationTime;
/// 记录上一帧动画时间
@property (nonatomic, assign) CFTimeInterval lastTime;
/// 记录动画已持续的时间
@property (nonatomic, assign) CFTimeInterval progressTime;
/// 获取当前数字的block
@property (nonatomic, copy) ScottCurrentNumberBlock currentNumber;
/// 计数完成的block
@property (nonatomic, copy) ScottCompletionBlock completion;


@property (nonatomic, assign) ScottCurrentBufferFunction currentBufferFunction;

@end

@implementation ScottCounterEngine

- (instancetype)init {
    if (self = [super init]) {
        _currentBufferFunction = ScottBufferFunctionEaseInOut;
    }
    return self;
}

+ (instancetype)counterEngine {
    return [[self alloc] init];
}

- (void)fromNumber:(CGFloat)startNumber toNumber:(CGFloat)endNumber duration:(CFTimeInterval)duration animationOptions:(ScottCounterAnimationOptions)animationOption currentNumber:(ScottCurrentNumberBlock)currentNumber completion:(ScottCompletionBlock)completion {
    
    // 清空定时器
    [self scott_clearTimer];
    
    // 初始化相关变量
    _startNumber = startNumber;
    _endNumber = endNumber;
    _durationTime = duration;
    
    // 设置动画类型
    [self scott_setAnimationOptions:animationOption];
    
    // 记录block回调函数
    currentNumber ? _currentNumber = currentNumber : nil;
    completion ? _completion = completion : nil;
    
    _lastTime = CACurrentMediaTime();
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(scott_changeNumber)];
    _timer.frameInterval = 2;
    [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
}

- (void)scott_changeNumber {
    // 1.记录当前动画开始时间
    CFTimeInterval thisTime = CACurrentMediaTime();
    // 2.计算动画已持续的时间量
    _progressTime = _progressTime + (thisTime - _lastTime);
    // 3.准备下一次的计算
    _lastTime = thisTime;
    
    if (_progressTime >= _durationTime) {
        [self scott_clearTimer];
        _currentNumber ? _currentNumber(_endNumber) : nil;
        _completion ? _completion() : nil;
        return;
    }
    
    _currentNumber ? _currentNumber([self scott_caculateNumber]) : nil;
}

- (CGFloat)scott_caculateNumber {
    CGFloat percent = _progressTime / _durationTime;
    return _startNumber + ((_endNumber - _startNumber) * _currentBufferFunction(percent));
}


/**
 设置动画类型
 */
- (void)scott_setAnimationOptions:(ScottCounterAnimationOptions)options {
    switch (options) {
        case ScottCounterAnimationOptionCurveEaseInOut: {
            _currentBufferFunction = ScottBufferFunctionEaseInOut;
        }
            break;
        case ScottCounterAnimationOptionCurveEaseIn: {
            _currentBufferFunction = ScottBufferFunctionEaseIn;
        }
            break;
        case ScottCounterAnimationOptionCurveEaseOut: {
            _currentBufferFunction = ScottBufferFunctionEaseOut;
        }
            break;
        case ScottCounterAnimationOptionCurveLinear: {
            _currentBufferFunction = ScottBufferFunctionLinear;
        }
            break;
            
        default:
            break;
    }
}


/**
 清空定时器
 */
- (void)scott_clearTimer {
    [_timer invalidate];
    _timer = nil;
    _progressTime = 0.0;
}



#pragma mark - 动画函数
CGFloat ScottBufferFunctionEaseInOut(CGFloat p) {
    if (p == 0.0 || p == 1.0) {
        return p;
    }
    if (p < 0.5) {
        return 0.5 * pow(2, (20 * p) - 10);
    } else {
        return -0.5 * pow(2, (-20 * p) + 10) + 1;
    }
}

CGFloat ScottBufferFunctionEaseIn(CGFloat p) {
    return (p == 0.0) ? p : pow(2, 10 * (p - 1));
}

CGFloat ScottBufferFunctionEaseOut(CGFloat p) {
    return (p == 0.0) ? p : 1 - pow(2, -10 * p);
}

CGFloat ScottBufferFunctionLinear(CGFloat p) {
    return p;
}



@end
