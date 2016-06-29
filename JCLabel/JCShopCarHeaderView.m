//
//  JCShopCarHeaderView.m
//  Purchase
//
//  Created by 李策 on 16/5/13.
//  Copyright © 2016年 app.yasn.com. All rights reserved.
//

#import "JCShopCarHeaderView.h"

@implementation JCShopCarHeaderView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    //调用布局
    [self layoutJCUI];
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withTimeDuration:(NSTimeInterval)duration
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.title = title;
    self.duration = duration;
    //调用布局
    [self layoutJCUI];
    return self;
}
- (void)layoutJCUI
{
    //设置背景颜色
    self.backgroundColor = RGB_COLOR(224, 224, 224);
    //创建提示的image
    self.jcTipImage = [[UIImageView alloc]init];
    self.jcTipImage.image = [UIImage imageNamed:@"快赚积分喇叭.png"];
    [self addSubview:self.jcTipImage];
    [self.jcTipImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(15);
        make.left.mas_equalTo(self.mas_left).with.offset(15);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    //创建滚动视图
    self.jcScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, ScreenWidth-40, self.height)];
    self.jcScrollView.showsHorizontalScrollIndicator = NO;
    self.jcScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.jcScrollView];
    //创建提示label
    self.jcTipLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.jcTipLabel.font = [UIFont systemFontOfSize:14];
    self.jcTipLabel.textColor = [UIColor blackColor];
    self.jcTipLabel.text = self.title.length>0?self.title:@"";
    [self.jcScrollView addSubview:self.jcTipLabel];
    CGSize jcTipSize = [self sizeWithText:self.title font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, 45)];
      self.jcScrollView.contentSize = CGSizeMake(jcTipSize.width, 0);
    [self.jcTipLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(jcTipSize.width+1);
        make.height.mas_equalTo(15);
        make.left.mas_equalTo(self.jcScrollView.mas_left);
        make.top.mas_equalTo(self.jcScrollView.mas_top).with.offset(15);
    }];
    self.jcScrollView.delegate = self;
    self.tipWidth = jcTipSize.width;
    self.offset = 0;
    //创建定时器
    self.jcTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeTipOffset) userInfo:nil repeats:YES];
    self.jcOffset = self.tipWidth/(self.duration/0.5);
    
    
}
//根据文字返回尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (void)changeTipOffset
{
    NSLog(@"---%f  ---%f",self.offset,self.tipWidth);
    if (self.offset>= self.tipWidth) {
        self.offset = 0;
        [UIView animateWithDuration:0 animations:^{
            self.jcScrollView.contentOffset = CGPointMake(self.offset, 0);
        }];
    }
    else
    {
        self.offset += self.jcOffset;
        [UIView animateWithDuration:1 animations:^{
            self.jcScrollView.contentOffset = CGPointMake(self.offset, 0);
            
        }];

    }
}


- (void)resetScroll
{
    self.offset = 0;
    [UIView animateWithDuration:1 animations:^{
        self.jcScrollView.contentOffset = CGPointMake(self.offset, 0);
    }];
    }
- (void)startScroll
{
    [self.jcTimer fire];
}
- (void)stopScroll
{
    [self.jcTimer invalidate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
