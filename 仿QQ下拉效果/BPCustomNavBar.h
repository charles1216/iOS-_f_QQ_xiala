//
//  BPCustomNavBar.h
//  可拉伸头部控件
//
//  Created by 王征 on 17/5/9.
//  Copyright © 2017年 王征. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPCustomNavBar : UIView
{
    UIButton *leftBtn;
    UIButton *rightBtn;
    UILabel *titleLabel;
}

/**中间的标题*/
@property (nonatomic,strong) NSString *title;
/**标题颜色*/
@property (nonatomic,strong) UIColor *titleColor;

/**左边图片*/
@property (nonatomic,strong) NSString *leftImage;
/**右边的图片*/
@property (nonatomic,strong) NSString *rightImage;





@end
