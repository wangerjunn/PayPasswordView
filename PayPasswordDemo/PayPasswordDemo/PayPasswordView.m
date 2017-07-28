//
//  PayPasswordView.m
//  PayPasswordDemo
//
//  Created by 花花 on 2017/7/28.
//  Copyright © 2017年 花花. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "PayPasswordView.h"

@interface PayPasswordView () <UIKeyInput>
{
    NSInteger _passwordLength;
    CGFloat _squareWidth;
    CGFloat _pointRadius;
    UIView *passwordView;
}

@property (nonatomic, copy) NSMutableString *psdText;
@end

@implementation PayPasswordView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
        [self becomeFirstResponder];
    }
    return self;
}

- (instancetype)initPayPasswordViewByPasswordLenghth:(NSInteger)psdLength squareWidth:(CGFloat)squareWidth pointRadius:(CGFloat)pointRadius {
    if (self = [super initWithFrame:CGRectMake(kScreenWidth/2.0-squareWidth*psdLength/2.0, 100, squareWidth*psdLength, squareWidth)]) {
        
        self.psdText = [NSMutableString string];
        _passwordLength = psdLength;
        _squareWidth = squareWidth;
        _pointRadius = pointRadius;
        
        passwordView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, squareWidth)];
        passwordView.backgroundColor = [UIColor whiteColor];
        
        passwordView.layer.borderWidth = 1;
        passwordView.layer.borderColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1.0].CGColor;
        
        [self addSubview:passwordView];
        
        for (int i = 0; i < psdLength-1; i++) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(squareWidth*(i+1), 0, 1, squareWidth)];
            line.backgroundColor = [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1.0];
            [passwordView addSubview:line];
        }
        
        for (int i = 0; i < psdLength; i++) {
            UIView *point = [[UIView alloc]initWithFrame:CGRectMake(squareWidth*i+squareWidth/2.0-pointRadius, squareWidth/2.0-pointRadius, pointRadius*2, pointRadius*2)];
            point.layer.cornerRadius = pointRadius;
            point.layer.masksToBounds = YES;
            point.backgroundColor = [UIColor blackColor];
            point.tag = i+1;
            point.hidden = YES;
            [passwordView addSubview:point];
            
        }
    }
    
    return self;
}

/**
 *  是否能成为第一响应者
 */
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self becomeFirstResponder];
}

- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeNumberPad;
}

#pragma mark -- UIKeyInput
- (BOOL)hasText {
    return YES;
}

- (void)insertText:(NSString *)text {
    NSLog(@"%@",text);
    if (self.psdText.length == 6) {
        return;
    }
    self.psdText = (NSMutableString *) [self.psdText stringByAppendingString:text];
    
    [UIView animateWithDuration:.25 animations:^{
        UIView *pointView = (UIView *)[passwordView viewWithTag:self.psdText.length];
        
        pointView.hidden = NO;
    }];
    
    
}

- (void)deleteBackward {
    
    if (self.psdText.length > 0) {
        
        [UIView animateWithDuration:.25 animations:^{
            
            UIView *pointView = (UIView *)[passwordView viewWithTag:self.psdText.length];
            pointView.hidden = YES;
            self.psdText = (NSMutableString *) [self.psdText substringToIndex:self.psdText.length-1];
        }];
        
        
    }
    NSLog(@"删除按钮");
}


@end
