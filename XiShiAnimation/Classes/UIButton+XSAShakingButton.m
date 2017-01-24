//
//  UIButton+XSAShakingButton.m
//  ShakeButtonDemo
//
//  Created by xishi on 2017/1/16.
//  Copyright © 2017年 xs. All rights reserved.
//

#import "UIButton+XSAShakingButton.h"
#import <objc/runtime.h>
#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)


@interface UIButton () <CAAnimationDelegate>
@property(nonatomic) void (^stoppedBlock)();
@end

@implementation UIButton (XSAShakingButton)

- (void)shakeWithStoppedBlock:(void (^)())stoppedBlock {
    @synchronized(self) {
        self.userInteractionEnabled = NO;
        self.stoppedBlock = stoppedBlock;
        [self shakingAnimation];
    }
}

- (void)setStoppedBlock:(void(^)())stoppedBlock
{
    objc_setAssociatedObject(self, @"KeyStoppedBlock", stoppedBlock, OBJC_ASSOCIATION_COPY);
}

- (void(^)())stoppedBlock
{
    return objc_getAssociatedObject(self, @"KeyStoppedBlock");
}

- (void)shakingAnimation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.delegate = self;
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(Angle2Radian(-5)), @(Angle2Radian(5)), @(Angle2Radian(-5))];
    anim.duration = 0.2;

    anim.repeatCount = 3;
    // 动画执行完毕后恢复状态
    anim.removedOnCompletion = YES;
    anim.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:anim forKey:@"shake"];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    self.userInteractionEnabled = YES;
    self.stoppedBlock();
}

@end
