//
//  ViewController.m
//  ScottCounter
//
//  Created by bopeng on 2017/3/16.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "ViewController.h"
#import "ScottCounter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeWithAnimationOptions:ScottCounterAnimationOptionCurveEaseInOut];
}

- (void)changeWithAnimationOptions:(ScottCounterAnimationOptions)options {
    [self exampleLabel1:options];
    [self exampleLabel2:options];
    [self exampleLabel3:options];
    
    [self exampleButton1:options];
    [self exampleButton2:options];
    [self exampleButton3:options];
}

- (IBAction)animateType:(UISegmentedControl *)sender {
    [self changeWithAnimationOptions:sender.selectedSegmentIndex + 1];
}

#pragma mark - UILabel
- (void)exampleLabel1:(ScottCounterAnimationOptions)options {
    self.label1.animationOptions = options;
    
    [self.label1 scott_fromNumber:0 toNumber:100 duration:1.5f format:^NSString *(CGFloat number) {
        return [NSString stringWithFormat:@"%.2f", number];
    }];
}

- (void)exampleLabel2:(ScottCounterAnimationOptions)options {
    self.label2.animationOptions = options;
    
    [self.label2 scott_fromNumber:0 toNumber:100 duration:1.5f animationOptions:options attributedFormat:^NSAttributedString *(CGFloat number) {
        NSString *string = [NSString stringWithFormat:@"%.2f%%",number];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        // 设置字体属性
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%.2f",number]];
        [attributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor brownColor]} range:range];
        return attributedString;
    } completion:^{
        self.label2.textColor = [UIColor redColor];
    }];
}

- (void)exampleLabel3:(ScottCounterAnimationOptions)options {
    self.label3.animationOptions = options;
    [self.label3 scott_fromNumber:0 toNumber:2015101 duration:1.5f format:^NSString *(CGFloat number) {
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.positiveFormat = @"###,##0.00";
        NSNumber *amountNumber = [NSNumber numberWithFloat:number];
        return [NSString stringWithFormat:@"¥%@",[formatter stringFromNumber:amountNumber]];
    }];
}

#pragma mark - UIButton
- (void)exampleButton1:(ScottCounterAnimationOptions)options {
    self.btn1.animationOptions = options;
    
    [self.btn1 scott_fromNumber:0 toNumber:100 duration:1.5f format:^NSString *(CGFloat number) {
        return [NSString stringWithFormat:@"%.2f", number];
    }];
}

- (void)exampleButton2:(ScottCounterAnimationOptions)options {
    self.btn2.animationOptions = options;
    
    [self.btn2 scott_fromNumber:0 toNumber:100 duration:1.5f animationOptions:options attributedFormat:^NSAttributedString *(CGFloat number) {
        NSString *string = [NSString stringWithFormat:@"%.2f%%",number];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        // 设置字体属性
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%.2f",number]];
        [attributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor brownColor]} range:range];
        return attributedString;
    } completion:^{
        NSAttributedString *attr = [self.btn2 attributedTitleForState:UIControlStateNormal];
        NSMutableAttributedString *mAttri = [[NSMutableAttributedString alloc] initWithAttributedString:attr];
        NSRange range = NSMakeRange(0, attr.length);
        [mAttri addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} range:range];
        [self.btn2 setAttributedTitle:(NSAttributedString *)mAttri forState:UIControlStateNormal];
    }];
}

- (void)exampleButton3:(ScottCounterAnimationOptions)options {
    self.btn3.animationOptions = options;
    
    [self.btn3 scott_fromNumber:0 toNumber:2015101 duration:1.5f format:^NSString *(CGFloat number) {
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.positiveFormat = @"###,##0.00";
        NSNumber *amountNumber = [NSNumber numberWithFloat:number];
        return [NSString stringWithFormat:@"¥%@",[formatter stringFromNumber:amountNumber]];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
