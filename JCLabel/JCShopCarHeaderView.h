//
//  JCShopCarHeaderView.h
//  Purchase
//
//  Created by 李策 on 16/5/13.
//  Copyright © 2016年 app.yasn.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+NJ.h"

#define TipMessage_shopcar_lunbo @"亲~当日16:00之前完成支付，当日发货；16:00之后完成支付的订单，将于次日发货，请悉知~"
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface JCShopCarHeaderView : UIView<UIScrollViewDelegate>
@property (strong,nonatomic) NSTimer * jcTimer;
@property (strong,nonatomic) UIImageView * jcTipImage;
@property (strong,nonatomic) UIScrollView * jcScrollView;
@property (strong,nonatomic) UILabel * jcTipLabel;
@property (strong,nonatomic) NSString * title;
@property (assign,nonatomic) NSTimeInterval   duration;
@property (assign,nonatomic) CGFloat  tipWidth;
@property (assign,nonatomic) CGFloat  offset;
@property (assign,nonatomic) CGFloat  jcOffset;
@property (assign,nonatomic) CGFloat  lastOffset;





- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withTimeDuration:(NSTimeInterval)duration;
- (void)resetScroll;
- (void)startScroll;
- (void)stopScroll;
@end
