//
//  ViewController.m
//  PayPasswordDemo
//
//  Created by 花花 on 2017/7/27.
//  Copyright © 2017年 花花. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

//view
#import "PayPasswordView.h"

@interface ViewController () 
{
    CGFloat squareWidth;
    CGFloat passwordLength;
    CGFloat pointRadius;//半径
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setTitle:@"支付密码"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    squareWidth = 50;
    passwordLength = 6;
    pointRadius = 6;
    
    PayPasswordView *passwordView = [[PayPasswordView alloc]initPayPasswordViewByPasswordLenghth:passwordLength squareWidth:squareWidth pointRadius:pointRadius];
    [self.view addSubview:passwordView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
