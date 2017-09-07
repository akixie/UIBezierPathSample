//
//  ViewController.m
//  UIBezierPathDemo
//
//  Created by akixie on 2017/9/6.
//  Copyright © 2017年 Aki.Xie. All rights reserved.
//

#import "ViewController.h"

//定义PI值
#define PI 3.14159265359

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //左侧实线半圆
    float leftViewWidth = 150;
    float leftViewHeight = 40;
    float viewX = 50;
    float viewY = 70;
    float leftLabelHeight = 21;
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, leftViewWidth, leftLabelHeight)];
    leftLabel.textColor = [UIColor darkGrayColor];
    leftLabel.text = @"左侧实线半圆";
    [self.view addSubview:leftLabel];
    viewY += leftLabelHeight;
    
    viewY += 10;
    UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, leftViewWidth, leftViewHeight)];
    [self roundLeftCornersRadius:20 sView:leftView1];
    leftView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:leftView1];
    viewY += leftViewHeight;
    
    
    viewY += 50;
    //右侧虚线半圆
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, leftViewWidth, leftLabelHeight)];
    rightLabel.textColor = [UIColor darkGrayColor];
    rightLabel.text = @"右侧虚线半圆";
    [self.view addSubview:rightLabel];
    viewY += leftLabelHeight;
    
    viewY += 10;
    UIView *rightView1 = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, leftViewWidth, leftViewHeight)];
    [self roundRightCornersRadius:20 sView:rightView1];
    [self.view addSubview:rightView1];
    viewY += leftViewHeight;
    
    
    viewY += 50;
    //集合
    UIView *mergeView = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, leftViewWidth*2, 80)];
    [self.view addSubview:mergeView];
    UILabel *mergeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, leftViewWidth+50, 21)];
    mergeLabel.textColor = [UIColor darkGrayColor];
    mergeLabel.text = @"合并,去除中间虚线";
    [mergeView addSubview:mergeLabel];
    
    
    UIView *leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 40, leftViewWidth, leftViewHeight)];
    [self roundLeftCornersRadius:20 sView:leftView2];
    leftView2.backgroundColor = [UIColor whiteColor];
    [mergeView addSubview:leftView2];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(leftViewWidth-1, 40, leftViewWidth, leftViewHeight)];
    [self roundRightCornersRadius:20 sView:rightView];
    [mergeView addSubview:rightView];
    //把leftView置顶，覆盖掉rightView左边的那要虚线
    [mergeView bringSubviewToFront:leftView2];
    
}

-(void)roundLeftCornersRadius:(CGFloat)radius sView:(UIView*)sView
{
    [self roundLeftCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft) radius:radius sView:sView];
}

-(void)roundLeftCorners:(UIRectCorner)corners radius:(CGFloat)radius sView:(UIView*)sView
{
    CGRect bounds = sView.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    sView.layer.mask = maskLayer;
    
    CAShapeLayer*   frameLayer = [CAShapeLayer layer];
    frameLayer.frame = bounds;
    frameLayer.path = maskPath.CGPath;
    frameLayer.strokeColor = [UIColor grayColor].CGColor;
    frameLayer.fillColor = nil;
    
    [sView.layer addSublayer:frameLayer];
}

-(void)roundRightCornersRadius:(CGFloat)radius sView:(UIView*)sView
{
    [self roundRightCorners:(UIRectCornerTopRight|UIRectCornerBottomRight) radius:radius sView:sView];
}

-(void)roundRightCorners:(UIRectCorner)corners radius:(CGFloat)radius sView:(UIView*)sView
{
    CGRect bounds = sView.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.lineDashPattern = @[@8, @4];//虚线圆角
    sView.layer.mask = maskLayer;
    CAShapeLayer*   frameLayer = [CAShapeLayer layer];
    frameLayer.frame = bounds;
    frameLayer.path = maskPath.CGPath;
    frameLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    frameLayer.lineDashPattern = @[@8, @4];//虚线圆角
    frameLayer.fillColor = nil;
    
    [sView.layer addSublayer:frameLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
