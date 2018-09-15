//
//  BeButtonView.h
//  BeButton
//
//  Created by wallace on 2018/9/13.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeButtonView : UIView

@property (strong, nonatomic) CAShapeLayer *circleShapeLayer;

/**
 @brief 中间按钮
 */
@property (strong, nonatomic) UIButton *centerButton;
/**
 @brief 开始动画
 */
- (void)startAnimation;
/**
 @brief 开始动画
 */
- (void)stopAnimation;

@end
