//
//  BPCustomNavBar.m
//  可拉伸头部控件
//
//  Created by 王征 on 17/5/9.
//  Copyright © 2017年 王征. All rights reserved.
//

#import "BPCustomNavBar.h"

@implementation BPCustomNavBar

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width, 64.0f);
        
    }
    return self;
}

- (void)setLeftImage:(NSString *)leftImage {
    _leftImage = leftImage;
    [leftBtn setBackgroundImage:[UIImage imageNamed:_leftImage] forState:UIControlStateNormal];
}

- (void)setRightImage:(NSString *)rightImage {
    _rightImage = rightImage;
    [rightBtn setBackgroundImage:[UIImage imageNamed:_rightImage] forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    titleLabel.textColor = titleColor;
    
}

- (void)drawRect:(CGRect)rect {
    CGRect frame = self.frame;
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:_leftImage] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(15.0f, 32.0f, 22.0f, 16.0f);
    [self addSubview:leftBtn];
    
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:_rightImage] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(self.frame.size.width-37.0f, 30.0f, 22.0f, 22.0f);
    [self addSubview:rightBtn];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = _titleColor;
    titleLabel.text = _title;
    titleLabel.center = CGPointMake(frame.size.width/2, (frame.size.height+20)/2);
    titleLabel.bounds = CGRectMake(0.0f, 0.0f, 100.0f, frame.size.height-20.0f);
    [self addSubview:titleLabel];
}

@end
