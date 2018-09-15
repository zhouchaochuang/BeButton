//
//  BeButtonView.m
//  BeButton
//
//  Created by wallace on 2018/9/13.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import "BeButtonView.h"

@interface BeButtonView()

@end


@implementation BeButtonView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpLayers];
        [self.centerButton setBackgroundImage:[UIImage imageNamed:@"z3"] forState:UIControlStateNormal];
        [self.centerButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchDown];
        [self.centerButton addTarget:self action:@selector(stopAnimation) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
        
        
    }
    return self;
}
/**
 @brief 初始化layer
 */
- (void)setUpLayers
{
    CGFloat width = self.bounds.size.width;
    
    self.circleShapeLayer = [CAShapeLayer layer];
    _circleShapeLayer.bounds = CGRectMake(0, 0, width, width);
    _circleShapeLayer.position = CGPointMake(width / 2.0, width / 2.0);

    _circleShapeLayer.fillColor = [UIColor colorWithRed:71/255.f green:141/255.f blue:228/255.f alpha:1].CGColor;
    _circleShapeLayer.opacity = 0.0;
    
     UIBezierPath *bPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width, width)];
    
    
    _circleShapeLayer.path =bPath.CGPath;
    
    
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.bounds = CGRectMake(0, 0, width, width);
    replicator.position = CGPointMake(width / 2.0, width / 2.0);
    replicator.instanceDelay = 0.5;
    replicator.instanceCount = 8;
    
    [replicator addSublayer:_circleShapeLayer];
    [self.layer addSublayer:replicator];
}
/**
 @brief 开始动画
 */
- (void)startAnimation
{
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = [NSNumber numberWithFloat:0.5];
    alphaAnim.toValue = [NSNumber numberWithFloat:0.0];
    
    CABasicAnimation *scaleAnim =[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 0.5, 0.5, 0.0);
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:t2];
    CATransform3D t3 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnim.toValue = [NSValue valueWithCATransform3D:t3];

    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[alphaAnim, scaleAnim];
    groupAnimation.duration = 2.0;
    groupAnimation.autoreverses = NO;
    groupAnimation.repeatCount = HUGE;
    
    [_circleShapeLayer addAnimation:groupAnimation forKey:nil];
}
/**
 @brief 开始动画
 */
- (void)stopAnimation
{
    [_circleShapeLayer removeAllAnimations];
}

#pragma mark 懒加载
-(UIButton*)centerButton
{
    if(_centerButton == nil)
    {
        _centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height/2)];
        _centerButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSubview:_centerButton];
        
    }
    return _centerButton;
}

@end

