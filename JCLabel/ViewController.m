//
//  ViewController.m
//  JCLabel
//
//  Created by 李策 on 16/5/13.
//  Copyright © 2016年 app.yasn.com. All rights reserved.
//

#import "ViewController.h"
#import "JCShopCarHeaderView.h"

@interface ViewController ()
@property (strong,nonatomic) JCShopCarHeaderView * jcHeaderView;
@property (strong,nonatomic) UILabel * labelShow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建headerView
    self.jcHeaderView = [[JCShopCarHeaderView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 45) withTitle:TipMessage_shopcar_lunbo withTimeDuration:14];
    [self.jcHeaderView startScroll];
    [self.view addSubview:self.jcHeaderView];
    self.labelShow = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth, 100, 500, 20)];
    self.labelShow.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.labelShow];
    CGRect frame = self.labelShow.frame;
    frame.origin.x = ScreenWidth;
    self.labelShow.frame = frame;
    
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:8.8f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    
    frame = self.labelShow.frame;
    frame.origin.x = -ScreenWidth;
    self.labelShow.frame = frame;
    [UIView commitAnimations];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
